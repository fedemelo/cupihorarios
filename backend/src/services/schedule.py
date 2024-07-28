from src.optimization_model.generate_optimal_schedule import generate_scheduled_slots_based_on_availability
from src.schemas.schedule import ScheduleCreate, ScheduleUpdate
from pandas import DataFrame, ExcelWriter
from src.models.schedule import Schedule
from sqlalchemy.orm import Session
from uuid import UUID, uuid4
from io import BytesIO


def create_schedule(db: Session, schedule: ScheduleCreate) -> Schedule:
    db_schedule = Schedule(
        **schedule.model_dump(exclude_none=True), id=uuid4(), is_official=False)
    db_schedule.scheduled_slots = generate_scheduled_slots_based_on_availability(
        db, db_schedule)
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


def download_schedule_as_excel(schedule: Schedule) -> bytes:
    time_slots = sorted({slot.assistant_availability.time_slot_id.partition(", ")[2]
                        for slot in schedule.scheduled_slots})

    columns = []
    for day in ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday']:
        columns.append(f"{day} Primary")
        columns.append(f"{day} Secondary")

    df = DataFrame(index=time_slots, columns=columns)

    for slot in schedule.scheduled_slots:
        time_slot = slot.assistant_availability.time_slot_id.partition(", ")[2]
        day = slot.assistant_availability.time_slot.day.value
        nickname = slot.assistant_availability.assistant.nickname
        column = f"{day} Primary" if not slot.is_remote else f"{day} Secondary"
        df.at[time_slot, column] = nickname

    df = df.fillna("")

    output = BytesIO()
    writer = ExcelWriter(output, engine='openpyxl')
    df.to_excel(writer, sheet_name='Schedule')
    writer.close()
    output.seek(0)
    return output.getvalue()
