from src.schemas.time_slot import TimeSlotCreate, TimeSlotUpdate
from src.models.time_slot import Day, TimeSlot
from sqlalchemy.orm import Session
from sqlalchemy import case, asc
from uuid import UUID


def create_time_slot(db: Session, time_slot: TimeSlotCreate) -> TimeSlot:
    db_time_slot = TimeSlot(**time_slot.model_dump(exclude_none=True))
    db.add(db_time_slot)
    db.commit()
    db.refresh(db_time_slot)
    return db_time_slot


def get_time_slot_by_id(db: Session, time_slot_id: UUID) -> TimeSlot:
    return db.query(TimeSlot).filter(TimeSlot.id == time_slot_id).first()


def get_time_slots(db: Session, skip: int = 0, limit: int = 100) -> list[TimeSlot]:
    day_order = case(
        (TimeSlot.day == Day.MONDAY, 0),
        (TimeSlot.day == Day.TUESDAY, 1),
        (TimeSlot.day == Day.WEDNESDAY, 2),
        (TimeSlot.day == Day.THURSDAY, 3),
        (TimeSlot.day == Day.FRIDAY, 4),
        (TimeSlot.day == Day.SATURDAY, 5),
        (TimeSlot.day == Day.SUNDAY, 6)
    )
    return db.query(TimeSlot).order_by(day_order, asc(TimeSlot.start_hour)).offset(skip).limit(limit).all()


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
