from src.schemas.time_slot import TimeSlotCreate, TimeSlotUpdate
from src.models.time_slot import Day, TimeSlot
from sqlalchemy.orm import Session
from uuid import UUID


DAYS_ORDER = {
    Day.MONDAY.value: 0,
    Day.TUESDAY.value: 1,
    Day.WEDNESDAY.value: 2,
    Day.THURSDAY.value: 3,
    Day.FRIDAY.value: 4,
    Day.SATURDAY.value: 5,
    Day.SUNDAY.value: 6
}


def create_time_slot(db: Session, time_slot: TimeSlotCreate) -> TimeSlot:
    db_time_slot = TimeSlot(**time_slot.model_dump(exclude_none=True))
    db.add(db_time_slot)
    db.commit()
    db.refresh(db_time_slot)
    return db_time_slot


def get_time_slot_by_id(db: Session, time_slot_id: UUID) -> TimeSlot:
    return db.query(TimeSlot).filter(TimeSlot.id == time_slot_id).first()


def get_time_slots(db: Session, skip: int = 0, limit: int = 100) -> list[TimeSlot]:
    return _sort_by_day_and_start_hour(db.query(TimeSlot).offset(skip).limit(limit).all())


def _sort_by_day_and_start_hour(time_slots: list[TimeSlot]) -> list[TimeSlot]:
    return sorted(time_slots, key=lambda time_slot: (DAYS_ORDER[time_slot.day.value], time_slot.start_hour))


def update_time_slot(db: Session, time_slot_id: UUID, time_slot: TimeSlotUpdate) -> TimeSlot:
    db.query(TimeSlot).filter(TimeSlot.id == time_slot_id).update(
        time_slot.model_dump(exclude_none=True))
    db.commit()
    return db.query(TimeSlot).filter(TimeSlot.id == time_slot_id).first()


def delete_time_slot(db: Session, time_slot_id: UUID) -> dict:
    db.query(TimeSlot).filter(TimeSlot.id == time_slot_id).delete()
    db.commit()
    return {"message": "Time slot deleted successfully"}


def delete_all_time_slots(db: Session) -> dict:
    db.query(TimeSlot).delete()
    db.commit()
    return {"message": "All time slots deleted successfully"}
