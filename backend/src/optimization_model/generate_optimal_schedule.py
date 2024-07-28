from src.models.assistant import Assistant
from src.services.assistant_availability import get_an_assistants_on_site_availabilities, get_an_assistants_availabilities
from src.services.assistant import get_assistants, get_assistant_by_code, get_hired_hours_of_all_assistants
from src.models.scheduled_slot import ScheduledSlot
from src.services.time_slot import get_time_slots
from sqlalchemy.orm import Session
from typing import Dict, List, Set

from pyomo.environ import (
    ConcreteModel,
    Var,
    Objective,
    Constraint,
    Binary,
)
from pyomo.opt import SolverFactory

# The model aims for each assistant to have an assigned number of hours as
# proportional as possible to the number of hours they were hired for in
# relation to the total number of hours available.
# The margin of error below may need to be adjusted depending on the assistants' availabilities.
PROPORTIONAL_HIRED_HOURS_MARGIN = 5.

model = ConcreteModel()


def generate_scheduled_slots_based_on_availability(db: Session) -> List[ScheduledSlot]:
    # Sets
    model.time_slots = _generate_time_slots(db)

    # Parameters
    model.time_slots_weights = _generate_time_slots_weights(db)
    add_availability_parameters(db, model)
    add_parameters_where_no_assistant_is_available(db, model)
    add_parameters_for_working_hours(db, model)

    add_variables_for_assistants(db, model)

    # Objective function
    define_objective_function(db, model)

    # Constraints
    add_constraint_each_time_slot_has_one_primary_and_one_secondary_assistant(
        db, model)
    add_constraint_to_assign_only_if_available(db, model)
    add_constraint_no_assistant_is_omnipresent(db, model)

    # Respect contract hours
    add_constraint_respect_contract_hours(db, model)

    # Solve
    SolverFactory("glpk").solve(model, tee=True)

    assistants_codes = _get_assistants_codes(db)
    with open('funciona_endpoints.txt', 'w') as f:
        for h in model.time_slots:
            primary_str = ''.join(f'P: {assistant} ' if getattr(model, f'primary_{assistant}')[
                h].value else '' for assistant in assistants_codes)
            secondary_str = ''.join(f'S: {assistant} ' if getattr(model, f'secondary_{assistant}')[
                                    h].value else '' for assistant in assistants_codes)
            f.write(f'{h}: {primary_str}{secondary_str}\n')


def add_availability_parameters(db: Session, model: ConcreteModel) -> None:
    """
    Adds a parameter to the model for each assistant's availability, on_site and remote.
    Parameters are named 'on_site_availability_{assistant_code}' and 'remote_availability_{assistant_code}'.

    Each parameter is a dictionary with all time slots as keys, and values:
    - 1 if the assistant is available at that time (on_site or remote, respectively)
    - 0 otherwise
    """
    for type in ['remote', 'on_site']:
        for assistant_code in _get_assistants_codes(db):
            setattr(model,
                    f"{type}_availability_{assistant_code}",
                    _generate_assistant_availability(db,
                                                     assistant_code,
                                                     model.time_slots,
                                                     remote_only=(type == 'remote')))


def add_parameters_where_no_assistant_is_available(db: Session, model: ConcreteModel) -> None:
    """
    Adds 4 parameters to the model, to account for time slots where it is impossible to assign 
    both a primary and a secondary assistant, or where no assistant is available at all.

    Each parameter is a dictionary with all time slots as keys, and values:
    1. 'no_assistant_is_available_remote': 1 if no assistant is available at that time (neither on_site nor remote), 0 otherwise
    2. 'one_assistant_is_available_remote': 1 if only one assistant is available at that time, 0 otherwise
    3. 'no_assistant_is_available_on_site': 1 if no assistant is available on_site at that time, 0 otherwise
    4. 'one_assistant_is_available_on_site': 1 if only one assistant is available on_site at that time, 0 otherwise
    """
    for type in ['on_site', 'remote']:
        assistants_availabilities = [getattr(model, f"{type}_availability_{assistant_code}")
                                     for assistant_code in _get_assistants_codes(db)]
        setattr(model,
                f"no_assistant_is_available_{type}",
                _generate_time_slots_where_no_assistant_is_available(assistants_availabilities))
        setattr(model,
                f"one_assistant_is_available_{type}",
                _generate_time_slots_where_only_one_assistant_is_available(assistants_availabilities))


def add_parameters_for_working_hours(
    db: Session,
    model: ConcreteModel
) -> Dict[int, float]:
    """
    Adds parameters to the model that determine the amount of hours each assistant should work, on_site and remote.

    Parameters for an assistant are named 'on_site_hours_{assistant_code}' and 'remote_hours_{assistant_code}'.
    """
    for type in ['remote', 'on_site']:
        for assistant_code in _get_assistants_codes(db):
            setattr(model,
                    f"{type}_hours_{assistant_code}",
                    _calculate_assistant_hours(db, assistant_code, type))


def add_variables_for_assistants(db: Session, model: ConcreteModel) -> None:
    """
    Adds variables to the model that determine if an assistant is primary or secondary at a given time slot.

    Variables for an assistant are named 'primary_{assistant_code}' and 'secondary_{assistant_code}'.
    """
    for assistant_code in _get_assistants_codes(db):
        setattr(model,
                f'primary_{assistant_code}',
                Var(model.time_slots, domain=Binary))
        setattr(model,
                f'secondary_{assistant_code}',
                Var(model.time_slots, domain=Binary))


def define_objective_function(db: Session, model: ConcreteModel) -> None:
    """
    Defines the objective function of the model.
    The objective is to minimize the sum of all primary and secondary variables for each assistant at each time slot.

    TODO: The objective is to minimize the difference between the number of hours each assistant works and the 
    number of hours they were hired for, in proportion to the total number of hours the center will operate.
    """
    model.obj = Objective(
        expr=sum(
            sum(
                getattr(model, f'primary_{assistant_code}')[time_slot] +
                getattr(model, f'secondary_{assistant_code}')[time_slot]
                for assistant_code in _get_assistants_codes(db)
            )
            for time_slot in model.time_slots
        )
    )


def add_constraint_each_time_slot_has_one_primary_and_one_secondary_assistant(db: Session, model: ConcreteModel) -> None:
    """
    Adds constraints to the model to ensure that each time slot has exactly one primary and one secondary assistant.

    The constraints are named 'habemus_primary' and 'habemus_secondary'.
    If no assistant is available at a given time slot, the constraint is automatically satisfied.
    """
    assistants_codes = _get_assistants_codes(db)

    for slot_type, type in [('primary', 'on_site'), ('secondary', 'remote')]:
        setattr(
            model,
            f"habemus_{slot_type}",
            Constraint(
                model.time_slots,
                rule=(lambda model, time_slot:
                      sum(
                          getattr(model,
                                  f'{slot_type}_{assistant}')[time_slot]
                          for assistant in assistants_codes
                      ) + getattr(model, f'no_assistant_is_available_{type}')[time_slot]
                      + (getattr(model, f'one_assistant_is_available_{type}')[
                         time_slot] if slot_type == 'secondary' else 0)
                      == 1
                      )
            )
        )


def add_constraint_to_assign_only_if_available(db: Session, model: ConcreteModel) -> None:
    """
    Adds constraints to the model to ensure that an assistant can only be assigned to a primary
    time slot if they are available on_site at that time, and to a secondary time slot if they are available.

    """
    for assistant_code in _get_assistants_codes(db):
        for slot_type, type in [('primary', 'on_site'), ('secondary', 'remote')]:
            setattr(
                model,
                f"available_{assistant_code}_{slot_type}",
                Constraint(
                    model.time_slots,
                    rule=(lambda model, time_slot:
                          getattr(model, f"{slot_type}_{assistant_code}")[time_slot] <=
                          getattr(model, f"{type}_availability_{assistant_code}")[
                              time_slot]
                          )
                )
            )


def add_constraint_no_assistant_is_omnipresent(db: Session, model: ConcreteModel) -> None:
    """
    Adds constraints to the model to ensure that an assistant cannot be both primary and secondary at the same time.
    """
    for assistant_code in _get_assistants_codes(db):
        setattr(
            model,
            f"youre_not_omnipresent_{assistant_code}",
            Constraint(
                model.time_slots,
                rule=(lambda model, time_slot:
                      getattr(model, f"primary_{assistant_code}")[time_slot] +
                      getattr(model, f"secondary_{assistant_code}")[time_slot] <= 1),
            ),
        )


def add_constraint_respect_contract_hours(db: Session, model: ConcreteModel) -> None:
    """
    Adds constraints to the model to ensure that each assistant works the number of hours they were hired for, 
    in proportion to the total number of hours the center will operate.
    """
    contract_hour_bounds = {
        'max_hours': lambda total_hours, hired_hrs: total_hours <= hired_hrs + PROPORTIONAL_HIRED_HOURS_MARGIN,
        'min_hours': lambda total_hours, hired_hrs: total_hours >= hired_hrs - PROPORTIONAL_HIRED_HOURS_MARGIN
    }

    for assistant_code in _get_assistants_codes(db):
        for bound_name, compare_funct in contract_hour_bounds.items():
            for slot_type, type in [('primary', 'on_site'), ('secondary', 'remote')]:
                setattr(
                    model,
                    f"{bound_name}_as_{slot_type}_{assistant_code}",
                    Constraint(
                        rule=(lambda model:
                              compare_funct(
                                  sum(
                                      getattr(model, f'{slot_type}_{assistant_code}')[time_slot] *
                                      model.time_slots_weights[time_slot]
                                      for time_slot in model.time_slots
                                  ),
                                  getattr(model,
                                          f"{type}_hours_{assistant_code}")
                              )
                              )
                    ),
                )


def _calculate_assistant_hours(db: Session, assistant_code: int, type: str) -> float:
    """
    Generates the number of hours an assistant should work, on_site or remote, based on their contract in proportion 
    to the total hours the center will operate.
    Notice the center may operate for a different number of hours on_site and remotely.

    Total on site hours = sum of all time slots where the center operates on site - 
                          sum of all time slots where no assistant is available on site
    Total remote hours = sum of all time slots where the center operates remotely -
                         sum of all time slots where no assistant is available
    """
    no_assistant_is_available = getattr(
        model, f"no_assistant_is_available_{type}")
    total_operation_hours = sum(
        model.time_slots_weights[time_slot]
        for time_slot in model.time_slots
        if no_assistant_is_available[time_slot] == 0
    )
    return (get_assistant_by_code(db, assistant_code).hired_hours /
            get_hired_hours_of_all_assistants(db) *
            total_operation_hours)


def _generate_time_slots(db: Session) -> Set[str]:
    """
    Generates a set of all possible time slots in the format 'Day, StartHour-EndHour'.

    E.g.: 'Monday, 09:00-09:30'
    """
    return {str(time_slot) for time_slot in get_time_slots(db)}


def _generate_time_slots_weights(db: Session) -> Dict[str, int]:
    """
    Generates a dictionary of time slots and their respective weights.
    Time slots of one hour have a weight of 1; time slots of half an hour have a weight of 0.5.

    E.g.: {'Monday, 08:00-09:00': 1, 'Monday, 09:00-09:30': 0.5}
    """
    return {str(time_slot):
            1 if (time_slot.end_hour - time_slot.start_hour == 100) else 0.5
            for time_slot in get_time_slots(db)}


def _get_assistants_codes(db: Session) -> List[int]:
    """
    Gets a list of all assistant codes.
    """
    return [assistant.code for assistant in get_assistants(db)]


def _generate_assistant_availability(db: Session, assistant_code: int, time_slots: set, remote_only: bool = False) -> Dict[str, int]:
    """
    For a given assistant, generates a dictionary with all time slots as keys 
    and 1 if the assistant is available at that time, 0 otherwise.
    """
    get_assistants_availabilities = get_an_assistants_availabilities if remote_only else get_an_assistants_on_site_availabilities
    return {**{time_slot: 0 for time_slot in time_slots},
            **{str(assistant_availability.time_slot): 1
               for assistant_availability in get_assistants_availabilities(db, assistant_code)}}


def _generate_time_slots_where_no_assistant_is_available(assistants_availabilities: List[Dict[str, int]]) -> Dict[str, int]:
    """
    Generates a dictionary with all time slots where value is 1 when no assistant is available.
    """
    return {time_slot:
            1 if all(
                availability[time_slot] == 0 for availability in assistants_availabilities) else 0
            for time_slot in assistants_availabilities[0]}


def _generate_time_slots_where_only_one_assistant_is_available(assistants_availabilities: List[Dict[str, int]]) -> Dict[str, int]:
    """
    Generates a dictionary with all time slots where value is 1 when only one assistant is available.
    """
    return {time_slot:
            1 if sum(availability[time_slot]
                     for availability in assistants_availabilities) == 1 else 0
            for time_slot in assistants_availabilities[0]}
