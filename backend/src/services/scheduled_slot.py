from src.schemas.scheduled_slot import ScheduledSlotCreate, ScheduledSlotUpdate
from src.models.scheduled_slot import ScheduledSlot
from src.services.time_slot import DAYS_ORDER
from sqlalchemy.orm import Session
from uuid import UUID


def create_scheduled_slot(db: Session, scheduled_slot: ScheduledSlotCreate) -> ScheduledSlot:
    db_scheduled_slot = ScheduledSlot(
        **scheduled_slot.model_dump(exclude_none=True))
    db.add(db_scheduled_slot)
    db.commit()
    db.refresh(db_scheduled_slot)
    return db_scheduled_slot


def get_scheduled_slot(db: Session, schedule_id: UUID, assistant_availability_id: UUID) -> ScheduledSlot:
    return db.query(ScheduledSlot).filter(ScheduledSlot.schedule_id == schedule_id, ScheduledSlot.assistant_availability_id == assistant_availability_id).first()


def get_scheduled_slots(db: Session, skip: int = 0, limit: int = 100) -> list[ScheduledSlot]:
    return _sort_by_time_slots(db.query(ScheduledSlot).offset(skip).limit(limit).all())


def _sort_by_time_slots(scheduled_slots: list[ScheduledSlot]) -> list[ScheduledSlot]:
    return sorted(scheduled_slots, key=lambda slot: (DAYS_ORDER[slot.assistant_availability.time_slot.day.value], slot.assistant_availability.time_slot.start_hour))


def update_scheduled_slot(db: Session, schedule_id: UUID, assistant_availability_id: UUID, scheduled_slot: ScheduledSlotUpdate) -> ScheduledSlot:
    db.query(ScheduledSlot).filter(ScheduledSlot.schedule_id == schedule_id, ScheduledSlot.assistant_availability_id ==
                                   assistant_availability_id).update(scheduled_slot.model_dump(exclude_none=True))
    db.commit()
    return db.query(ScheduledSlot).filter(ScheduledSlot.schedule_id == schedule_id, ScheduledSlot.assistant_availability_id == assistant_availability_id).first()


def delete_scheduled_slot(db: Session, schedule_id: UUID, assistant_availability_id: UUID) -> dict:
    db.query(ScheduledSlot).filter(ScheduledSlot.schedule_id == schedule_id,
                                   ScheduledSlot.assistant_availability_id == assistant_availability_id).delete()
    db.commit()
    return {"message": "Scheduled slot deleted successfully"}


def delete_all_scheduled_slots(db: Session) -> dict:
    db.query(ScheduledSlot).delete()
    db.commit()
    return {"message": "All scheduled slots deleted successfully"}
