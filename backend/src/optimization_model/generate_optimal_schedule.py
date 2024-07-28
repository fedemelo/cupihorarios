from src.models.schedule import Schedule
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
    minimize,
    TerminationCondition
)
from pyomo.opt import SolverFactory

model = ConcreteModel()


def generate_scheduled_slots_based_on_availability(db: Session, schedule: Schedule) -> List[ScheduledSlot]:
    """
    Uses a Pyomo optimization model to generate an optimal schedule based on assistant availability.

    The model is a binary integer linear program that assigns each assistant to a time slot as primary or secondary,
    and tries to assign a primary and secondary assistant to each time slot.

    A margin of 0.5 (half an hour) is added to the hired hours of each assistant to ensure that the model is feasible.
    I.e., the model will try for each assistant to work proportionally to the number of hours they are hired for,
    in comparison to the total number of hours available and other assistants' hours.
    However, the exact number of hours each assistant works may vary slightly.
    The value for the margin increases by 0.5 until the model is feasible.

    Returns a list of ScheduledSlot objects with the generated schedule.
    """

    is_infeasible = True
    hired_hours_margin = 0.5
    while is_infeasible:
        add_sets_to_model(db, model)
        add_parameters_to_model(db, model)
        add_variables_for_assistants(db, model)
        define_objective_function(db, model)
        add_constraints_to_model(db, model, hired_hours_margin)

        results = SolverFactory("glpk").solve(model, tee=True)

        if results.solver.termination_condition == TerminationCondition.infeasible:
            hired_hours_margin += 0.5
        else:
            is_infeasible = False

    for time_slot in model.time_slots:
        for assistant_code in get_assistants_codes(db):
            for type in ['primary', 'secondary']:
                if getattr(model, f'{type}_{assistant_code}')[time_slot].value:
                    print(f'{type} {assistant_code} at {time_slot}')

    return create_scheduled_slots_from_model(db, model, schedule)


def create_scheduled_slots_from_model(db: Session, model: ConcreteModel, schedule: Schedule) -> List[ScheduledSlot]:
    """
    Creates ScheduledSlot objects from the solved Pyomo optimization model.
    """
    scheduled_slots = []
    for time_slot in model.time_slots:
        for assistant_code in get_assistants_codes(db):
            for type in ['primary', 'secondary']:
                if getattr(model, f'{type}_{assistant_code}')[time_slot].value:
                    scheduled_slots.append(ScheduledSlot(
                        schedule_id=schedule.id,
                        is_remote=True if type == 'secondary' else False,
                        assistant_availability_id=f"{assistant_code}: {time_slot}"
                    ))
    return scheduled_slots


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

    This objective function simply tries to minimize the number of hours each assistant works.
    """
    model.obj = Objective(
        expr=sum(
            sum(
                getattr(model, f'primary_{assistant_code}')[time_slot] +
                getattr(model, f'secondary_{assistant_code}')[time_slot]
                for assistant_code in get_assistants_codes(db)
            )
            for time_slot in model.time_slots
        ),
        sense=minimize
    )
