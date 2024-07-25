from src.schemas.schedule import ScheduleCreate, ScheduleUpdate
from src.models.schedule import Schedule
from sqlalchemy.orm import Session
from uuid import UUID


def create_schedule(db: Session, schedule: ScheduleCreate) -> Schedule:
    db_schedule = Schedule(**schedule.model_dump(exclude_none=True))
    db.add(db_schedule)
    db.commit()
    db.refresh(db_schedule)
    return db_schedule


def get_schedule_by_id(db: Session, schedule_id: UUID) -> Schedule:
    return db.query(Schedule).filter(Schedule.id == schedule_id).first()


def get_official_schedule(db: Session) -> Schedule:
    return db.query(Schedule).filter(Schedule.is_official).first()


def get_schedules(db: Session, skip: int = 0, limit: int = 100) -> list[Schedule]:
    return db.query(Schedule).offset(skip).limit(limit).all()


def update_schedule(db: Session, schedule_id: UUID, schedule: ScheduleUpdate) -> Schedule:
    db.query(Schedule).filter(Schedule.id == schedule_id).update(
        schedule.model_dump(exclude_none=True))
    db.commit()
    return db.query(Schedule).filter(Schedule.id == schedule_id).first()


def set_schedule_as_official(db: Session, schedule_id: UUID) -> Schedule:
    db.query(Schedule).filter(Schedule.is_official).update(
        {"is_official": False})
    db.query(Schedule).filter(Schedule.id ==
                              schedule_id).update({"is_official": True})
    db.commit()
    return db.query(Schedule).filter(Schedule.id == schedule_id).first()


def delete_schedule(db: Session, schedule_id: UUID) -> dict:
    db.query(Schedule).filter(Schedule.id == schedule_id).delete()
    db.commit()
    return {"message": "Schedule deleted successfully"}


def delete_all_schedules(db: Session) -> dict:
    db.query(Schedule).delete()
    db.commit()
    return {"message": "All schedules deleted successfully"}
