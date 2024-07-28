from src.services.assistant_availability import get_an_assistants_on_site_availabilities, get_an_assistants_availabilities
from src.services.assistant import get_assistant_by_code, get_hired_hours_of_all_assistants
from src.services.time_slot import get_time_slots
from .utils import get_assistants_codes
from sqlalchemy.orm import Session
from typing import Dict, List

from pyomo.environ import ConcreteModel


def add_parameters_to_model(db: Session, model: ConcreteModel) -> None:
    """
    Adds parameters to the optimization model.

    The model consists of the following parameters:
    - time_slots_weights: A dictionary with the weight of each time slot
    - on_site_availability_{assistant_code}: A dictionary with the on-site availability of each assistant 
    - remote_availability_{assistant_code}: A dictionary with the availability of each assistant
    - no_assistant_is_available_{type}: A dictionary with time slots where no assistant is available, on_site or remote
    - one_assistant_is_available_{type}: A dictionary with time slots where only one assistant is available, on_site or remote
    - on_site_hours_{assistant_code}: The number of hours an assistant should work on site
    - remote_hours_{assistant_code}: The number of hours an assistant should work remotely
    """
    model.time_slots_weights = _generate_time_slots_weights(db)
    _add_availability_parameters(db, model)
    _add_parameters_where_no_assistant_is_available(db, model)
    _add_parameters_for_working_hours(db, model)


def _generate_time_slots_weights(db: Session) -> Dict[str, int]:
    """
    Generates a dictionary of time slots and their respective weights.
    Time slots of one hour have a weight of 1; time slots of half an hour have a weight of 0.5.

    E.g.: {'Monday, 08:00-09:00': 1, 'Monday, 09:00-09:30': 0.5}
    """
    return {str(time_slot):
            1 if (time_slot.end_hour - time_slot.start_hour == 100) else 0.5
            for time_slot in get_time_slots(db)}


def _add_availability_parameters(db: Session, model: ConcreteModel) -> None:
    """
    Adds a parameter to the model for each assistant's availability, on_site and remote.
    Parameters are named 'on_site_availability_{assistant_code}' and 'remote_availability_{assistant_code}'.

    Each parameter is a dictionary with all time slots as keys, and values:
    - 1 if the assistant is available at that time (on_site or remote, respectively)
    - 0 otherwise
    """

    for type in ['remote', 'on_site']:
        for assistant_code in get_assistants_codes(db):
            setattr(model,
                    f"{type}_availability_{assistant_code}",
                    _generate_assistant_availability(db,
                                                     assistant_code,
                                                     model.time_slots,
                                                     remote_only=(type == 'remote')))


def _generate_assistant_availability(db: Session, assistant_code: int, time_slots: set, remote_only: bool = False) -> Dict[str, int]:
    """
    For a given assistant, generates a dictionary with all time slots as keys 
    and 1 if the assistant is available at that time, 0 otherwise.
    """
    get_assistants_availabilities = get_an_assistants_availabilities if remote_only else get_an_assistants_on_site_availabilities
    return {**{time_slot: 0 for time_slot in time_slots},
            **{str(assistant_availability.time_slot): 1
               for assistant_availability in get_assistants_availabilities(db, assistant_code)}}


def _add_parameters_where_no_assistant_is_available(db: Session, model: ConcreteModel) -> None:
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
                                     for assistant_code in get_assistants_codes(db)]
        setattr(model,
                f"no_assistant_is_available_{type}",
                _generate_time_slots_where_no_assistant_is_available(assistants_availabilities))
        setattr(model,
                f"one_assistant_is_available_{type}",
                _generate_time_slots_where_only_one_assistant_is_available(assistants_availabilities))


def _add_parameters_for_working_hours(
    db: Session,
    model: ConcreteModel
) -> Dict[int, float]:
    """
    Adds parameters to the model that determine the amount of hours each assistant should work, on_site and remote.

    Parameters for an assistant are named 'on_site_hours_{assistant_code}' and 'remote_hours_{assistant_code}'.
    """
    for type in ['remote', 'on_site']:
        for assistant_code in get_assistants_codes(db):
            setattr(model,
                    f"{type}_hours_{assistant_code}",
                    _calculate_assistant_hours(db, assistant_code, type, model))


def _calculate_assistant_hours(db: Session, assistant_code: int, type: str, model: ConcreteModel) -> float:
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
