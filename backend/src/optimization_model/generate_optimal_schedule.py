from .constraints import add_constraints_to_model
from .params import add_parameters_to_model
from .utils import get_assistants_codes
from .sets import add_sets_to_model

from src.models.scheduled_slot import ScheduledSlot
from sqlalchemy.orm import Session
from typing import List

from pyomo.environ import (
    ConcreteModel,
    Var,
    Objective,
    Binary,
)
from pyomo.opt import SolverFactory

model = ConcreteModel()


def generate_scheduled_slots_based_on_availability(db: Session) -> List[ScheduledSlot]:
    add_sets_to_model(db, model)
    add_parameters_to_model(db, model)
    add_variables_for_assistants(db, model)
    define_objective_function(db, model)
    add_constraints_to_model(db, model)

    SolverFactory("glpk").solve(model, tee=True)

    assistants_codes = get_assistants_codes(db)
    with open('funciona_endpoints.txt', 'w') as f:
        for h in model.time_slots:
            primary_str = ''.join(f'P: {assistant} ' if getattr(model, f'primary_{assistant}')[
                h].value else '' for assistant in assistants_codes)
            secondary_str = ''.join(f'S: {assistant} ' if getattr(model, f'secondary_{assistant}')[
                                    h].value else '' for assistant in assistants_codes)
            f.write(f'{h}: {primary_str}{secondary_str}\n')


def add_variables_for_assistants(db: Session, model: ConcreteModel) -> None:
    """
    Adds variables to the model that determine if an assistant is primary or secondary at a given time slot.

    Variables for an assistant are named 'primary_{assistant_code}' and 'secondary_{assistant_code}'.
    """
    for assistant_code in get_assistants_codes(db):
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
                for assistant_code in get_assistants_codes(db)
            )
            for time_slot in model.time_slots
        )
    )
