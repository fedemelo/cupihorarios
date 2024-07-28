from src.services.time_slot import get_time_slots
from pyomo.environ import ConcreteModel
from sqlalchemy.orm import Session
from typing import Set


def add_sets_to_model(db: Session, model: ConcreteModel) -> None:
    """
    Adds sets to the optimization model.

    The model consists of a single set: all possible time_slots in which an assistant can work.
    """
    model.time_slots = _generate_time_slots(db)


def _generate_time_slots(db: Session) -> Set[str]:
    """
    Generates a set of all possible time slots in the format 'Day, StartHour-EndHour'.

    E.g.: 'Monday, 09:00-09:30'
    """
    return {str(time_slot) for time_slot in get_time_slots(db)}
