from src.services.assistant_availability import get_an_assistants_availabilities
from src.models.assistant_availability import AssistantAvailability
from src.models.time_slot import TimeSlot
from src.services.assistant import get_assistants
from src.models.scheduled_slot import ScheduledSlot
from src.services.time_slot import get_time_slots
from sqlalchemy.orm import Session
from typing import Dict, List

from pyomo.environ import (
    ConcreteModel,
    Var,
    Objective,
    Constraint,
    Binary,
)
from pyomo.opt import SolverFactory

model = ConcreteModel()


def generate_scheduled_slots_based_on_availability(db: Session) -> List[ScheduledSlot]:

    # Sets
    model.time_slots = _generate_time_slots(db)

    # Parameters: time slots weights
    model.time_slots_weights = _generate_time_slots_weights(db)

    # Parameters: availabilities
    for assistant_code in (assistants_codes := _get_assistants_codes(db)):
        setattr(model, f"availabilities_{assistant_code}",
                _generate_assistant_availabilities(db, assistant_code, model.time_slots))

    # Parameters: time slots where no assistant is available
    model.no_assistant_is_available = _generate_time_slots_where_no_assistant_is_available(assistants_availabilities := [
        getattr(model, f"availabilities_{assistant_code}") for assistant_code in assistants_codes])
    model.only_one_assistant_available = _generate_time_slots_where_only_one_assistant_is_available(
        assistants_availabilities)

    # Hardcoded for now
    assistants_required_hours = {
        201913554: 10,
        202020609: 10,
        202021525: 5,
        202011140: 5,
        201922019: 8,
        202112020: 5,
        202021113: 5
    }

    assistants_required_hours_sec = {
        201913554: 10,
        202020609: 10,
        202021525: 5,
        202011140: 5,
        201922019: 6,
        202112020: 5,
        202021113: 5
    }

    # Variables: assistants as primary and secondary
    for assistant in assistants_codes:
        setattr(model, f'primary_{assistant}', Var(
            model.time_slots, domain=Binary))
        setattr(model, f'secondary_{assistant}',
                Var(model.time_slots, domain=Binary))

    # Objective function
    model.obj = Objective(
        expr=sum(
            sum(
                getattr(model, f'primary_{assistant}')[time_slot] +
                getattr(model, f'secondary_{assistant}')[time_slot]
                for assistant in assistants_codes
            )
            for time_slot in model.time_slots
        )
    )

    # Constraints

    # Nobody can be primary and secondary at the same time
    # TODO: Redundant?
    for assistant in assistants_codes:
        setattr(
            model,
            f"{assistant}_is_not_omnipresent",
            Constraint(
                model.time_slots,
                rule=(lambda model, time_slot:
                      getattr(model, f"primary_{assistant}")[time_slot] +
                      getattr(model, f"secondary_{assistant}")[time_slot] <= 1),
            ),
        )

    # In each time slot, exactly one assistant must be primary
    model.habemus_primary = Constraint(
        model.time_slots,
        rule=(lambda model, time_slot:
              sum(
                  getattr(model, f'primary_{assistant}')[time_slot]
                  for assistant in assistants_codes
              ) + model.no_assistant_is_available[time_slot] == 1
              )
    )

    # In each time slot, exactly one assistant must be secondary
    model.habemus_secondary = Constraint(
        model.time_slots,
        rule=(lambda model, time_slot:
              sum(
                  getattr(model, f'secondary_{assistant}')[time_slot]
                  for assistant in assistants_codes
              ) + model.no_assistant_is_available[time_slot]
                + model.only_one_assistant_available[time_slot] == 1
              )
    )

    # Hours are only assigned if the assistant is available
    # Nobody can be primary and secondary at the same time
    for assistant in assistants_codes:
        setattr(
            model,
            f"{assistant}_is_available",
            Constraint(
                model.time_slots,
                rule=(lambda model, time_slot:
                      getattr(model, f"primary_{assistant}")[time_slot] +
                      getattr(model, f"secondary_{assistant}")[time_slot] <=
                      getattr(model, f"availabilities_{assistant}")[time_slot]),
            ),
        )

    # Respect contract hours
    contract_hour_bounds = {
        'max_hours': lambda total_hours, contract_hours: total_hours <= contract_hours + 1,
        'min_hours': lambda total_hours, contract_hours: total_hours >= contract_hours - 1
    }

    for assistant, hours in assistants_required_hours.items():
        for bound_name, compare_funct in contract_hour_bounds.items():
            setattr(
                model,
                f"{bound_name}_as_primary_{assistant}",
                Constraint(
                    rule=(lambda model:
                          compare_funct(
                              sum(
                                  getattr(model, f'primary_{assistant}')[time_slot] *
                                  model.time_slots_weights[time_slot]
                                  for time_slot in model.time_slots
                              ),
                              hours
                          )
                          )
                ),
            )

    for assistant, hours in assistants_required_hours_sec.items():
        for bound_name, compare_funct in contract_hour_bounds.items():
            setattr(
                model,
                f"{bound_name}_as_secondary_{assistant}",
                Constraint(
                    rule=(lambda model:
                          compare_funct(
                              sum(
                                  getattr(model, f'secondary_{assistant}')[time_slot] *
                                  model.time_slots_weights[time_slot]
                                  for time_slot in model.time_slots
                              ),
                              hours
                          )
                          )
                ),
            )

    # Solve
    SolverFactory("glpk").solve(model, tee=True)

    with open('funciona_endpoints.txt', 'w') as f:
        for h in model.time_slots:
            primary_str = ''.join(f'P: {assistant} ' if getattr(model, f'primary_{assistant}')[
                h].value else '' for assistant in assistants_codes)
            secondary_str = ''.join(f'S: {assistant} ' if getattr(model, f'secondary_{assistant}')[
                                    h].value else '' for assistant in assistants_codes)
            f.write(f'{h}: {primary_str}{secondary_str}\n')


def _generate_time_slots(db: Session) -> set:
    """
    Generates a set of all possible time slots in the format 'Day, StartHour-EndHour'.
    """
    return {str(time_slot) for time_slot in get_time_slots(db)}


def _generate_time_slots_weights(db: Session) -> Dict[str, int]:
    """
    Generates a dictionary of time slots and their respective weights.
    Time slots of one hour have a weight of 1; time slots of half an hour have a weight of 0.5.
    """
    return {str(time_slot):
            1 if (time_slot.end_hour - time_slot.start_hour == 100) else 0.5
            for time_slot in get_time_slots(db)}


def _get_assistants_codes(db: Session) -> List[int]:
    """
    Gets a list of all assistant codes.
    """
    return [assistant.code for assistant in get_assistants(db)]


def _generate_assistant_availabilities(db: Session, assistant_code: int, time_slots: set) -> Dict[str, int]:
    """
    For a given assistant, generates a dictionary with all time slots as keys 
    and 1 if the assistant is available at that time, 0 otherwise.
    """
    return {**{time_slot: 0 for time_slot in time_slots},
            **{str(assistant_availability.time_slot): 1
               for assistant_availability in get_an_assistants_availabilities(db, assistant_code)}}


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
