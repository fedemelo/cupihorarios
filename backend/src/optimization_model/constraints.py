from .utils import get_assistants_codes
from sqlalchemy.orm import Session

from pyomo.environ import (
    ConcreteModel,
    Constraint
)


# The model aims for each assistant to have an assigned number of hours as
# proportional as possible to the number of hours they were hired for in
# relation to the total number of hours available.
# The margin of error below may need to be adjusted depending on the assistants' availabilities.
PROPORTIONAL_HIRED_HOURS_MARGIN = 1.


def add_constraints_to_model(db: Session, model: ConcreteModel) -> None:
    _add_constraint_each_time_slot_has_one_primary_and_one_secondary_assistant(
        db, model)
    _add_constraint_to_assign_only_if_available(db, model)
    _add_constraint_no_assistant_is_omnipresent(db, model)
    _add_constraint_respect_contract_hours(db, model)


def _add_constraint_each_time_slot_has_one_primary_and_one_secondary_assistant(db: Session, model: ConcreteModel) -> None:
    """
    Adds constraints to the model to ensure that each time slot has exactly one primary and one secondary assistant.

    The constraints are named 'habemus_primary' and 'habemus_secondary'.
    If no assistant is available at a given time slot, the constraint is automatically satisfied.
    """
    assistants_codes = get_assistants_codes(db)

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


def _add_constraint_to_assign_only_if_available(db: Session, model: ConcreteModel) -> None:
    """
    Adds constraints to the model to ensure that an assistant can only be assigned to a primary
    time slot if they are available on_site at that time, and to a secondary time slot if they are available.

    """
    for assistant_code in get_assistants_codes(db):
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


def _add_constraint_no_assistant_is_omnipresent(db: Session, model: ConcreteModel) -> None:
    """
    Adds constraints to the model to ensure that an assistant cannot be both primary and secondary at the same time.
    """
    for assistant_code in get_assistants_codes(db):
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


def _add_constraint_respect_contract_hours(db: Session, model: ConcreteModel) -> None:
    """
    Adds constraints to the model to ensure that each assistant works the number of hours they were hired for, 
    in proportion to the total number of hours the center will operate.
    """
    contract_hour_bounds = {
        'max_hours': lambda total_hours, hired_hrs: total_hours <= hired_hrs + PROPORTIONAL_HIRED_HOURS_MARGIN,
        'min_hours': lambda total_hours, hired_hrs: total_hours >= hired_hrs - PROPORTIONAL_HIRED_HOURS_MARGIN
    }

    for assistant_code in get_assistants_codes(db):
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
