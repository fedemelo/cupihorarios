from src.schemas.assistant_availability import AssistantAvailabilityCreate, AssistantAvailabilityUpdate
from src.models.assistant_availability import AssistantAvailability
from src.services.time_slot import DAYS_ORDER
from sqlalchemy.orm import Session
from typing import List
from uuid import UUID


def create_assistant_availability(db: Session, assistant_availability: AssistantAvailabilityCreate) -> AssistantAvailability:
    db_assistant_availability = AssistantAvailability(
        **assistant_availability.model_dump(exclude_none=True))
    db.add(db_assistant_availability)
    db.commit()
    db.refresh(db_assistant_availability)
    return db_assistant_availability


def create_many_assistant_availabilities(db: Session, assistant_availabilities: list[AssistantAvailabilityCreate]) -> List[AssistantAvailability]:
    db_availabilities = [AssistantAvailability(
        **availability.model_dump(exclude_none=True)) for availability in assistant_availabilities]
    db.add_all(db_availabilities)
    db.commit()
    db.refresh(db_availabilities)
    return db_availabilities


def get_assistant_availability_by_id(db: Session, assistant_availability_id: UUID) -> AssistantAvailability:
    return db.query(AssistantAvailability).filter(AssistantAvailability.id == assistant_availability_id).first()


def get_an_assistants_availabilities(db: Session, assistant_code: int) -> list[AssistantAvailability]:
    return _sort_by_time_slots(db.query(AssistantAvailability).filter(AssistantAvailability.assistant_code == assistant_code).all())


def get_all_assistants_availabilities(db: Session, skip: int = 0, limit: int = 100) -> List[AssistantAvailability]:
    return _sort_by_time_slots(db.query(AssistantAvailability).offset(skip).limit(limit).all())


def update_assistant_availability(db: Session, assistant_availability_id: UUID, assistant_availability: AssistantAvailabilityUpdate) -> AssistantAvailability:
    db.query(AssistantAvailability).filter(AssistantAvailability.id == assistant_availability_id).update(
        assistant_availability.model_dump(exclude_none=True))
    db.commit()
    return db.query(AssistantAvailability).filter(AssistantAvailability.id == assistant_availability_id).first()


def delete_assistant_availability(db: Session, assistant_availability_id: UUID) -> dict:
    db.query(AssistantAvailability).filter(
        AssistantAvailability.id == assistant_availability_id).delete()
    db.commit()
    return {"message": "Assistant availability deleted successfully"}


def delete_all_assistant_availabilities(db: Session) -> dict:
    db.query(AssistantAvailability).delete()
    db.commit()
    return {"message": "All assistant availabilities deleted successfully"}


def _sort_by_time_slots(assistant_availabilities: List[AssistantAvailability]) -> List[AssistantAvailability]:
    return sorted(assistant_availabilities, key=lambda availability: (DAYS_ORDER[availability.time_slot.day.value], availability.time_slot.start_hour))
