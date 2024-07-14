from src.schemas.assistant_availability import AssistantAvailabilityCreate, AssistantAvailabilityUpdate
from src.models.assistant_availability import AssistantAvailability
from sqlalchemy.orm import Session
from uuid import UUID


def create_assistant_availability(db: Session, assistant_availability: AssistantAvailabilityCreate) -> AssistantAvailability:
    db_assistant_availability = AssistantAvailability(
        **assistant_availability.model_dump(exclude_none=True))
    db.add(db_assistant_availability)
    db.commit()
    db.refresh(db_assistant_availability)
    return db_assistant_availability


def get_assistant_availability_by_id(db: Session, assistant_availability_id: UUID) -> AssistantAvailability:
    return db.query(AssistantAvailability).filter(AssistantAvailability.id == assistant_availability_id).first()


def get_assistant_availabilities(db: Session, skip: int = 0, limit: int = 100) -> list[AssistantAvailability]:
    return db.query(AssistantAvailability).offset(skip).limit(limit).all()


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
