from src.schemas.schedule import ScheduleCreate, ScheduleUpdate, ScheduleResponse
from fastapi import APIRouter, Depends, HTTPException, Body, status
from src.exceptions import ITEM_NOT_FOUND
import src.services.schedule as service
from src.config.db_config import get_db
from sqlalchemy.orm import Session
from typing import Dict
from uuid import UUID


router = APIRouter(
    prefix="/schedule",
    tags=["schedule"],
    responses={404: {"detail": "Not found"}},
)


NAME: str = "Schedule"


@router.get("/{schedule_id}", response_model=ScheduleResponse, status_code=status.HTTP_200_OK)
def read_schedule_by_id(schedule_id: UUID, db: Session = Depends(get_db)):
    """
    Retrieve a schedule by its ID
    """
    if not (schedule := service.get_schedule_by_id(db, schedule_id)):
        raise HTTPException(status_code=404, detail=ITEM_NOT_FOUND.format(
            NAME, "ID", schedule_id))
    return schedule


@router.get("/", response_model=list[ScheduleResponse], status_code=status.HTTP_200_OK)
def read_schedules(skip: int = 0, limit: int = 100, db: Session = Depends(get_db)):
    """
    Retrieve all schedules
    """
    return service.get_schedules(db, skip, limit)


@router.post("/", response_model=ScheduleResponse, status_code=status.HTTP_201_CREATED)
def create_schedule(schedule: ScheduleCreate = Body(...), db: Session = Depends(get_db)):
    """
    Create a new schedule
    """
    return service.create_schedule(db, schedule)


@router.put("/{schedule_id}", response_model=ScheduleResponse, status_code=status.HTTP_200_OK)
def update_schedule(schedule_id: UUID, schedule: ScheduleUpdate = Body(...), db: Session = Depends(get_db)):
    """
    Update an existing schedule
    """
    if not service.get_schedule_by_id(db, schedule_id):
        raise HTTPException(status_code=404, detail=ITEM_NOT_FOUND.format(
            NAME, "ID", schedule_id))
    return service.update_schedule(db, schedule_id, schedule)


@router.delete("/{schedule_id}", response_model=Dict[str, str], status_code=status.HTTP_200_OK)
def delete_schedule(schedule_id: UUID, db: Session = Depends(get_db)):
    """
    Delete an existing schedule
    """
    if not service.get_schedule_by_id(db, schedule_id):
        raise HTTPException(status_code=404, detail=ITEM_NOT_FOUND.format(
            NAME, "ID", schedule_id))
    return service.delete_schedule(db, schedule_id)


@router.delete("/", response_model=Dict[str, str], status_code=status.HTTP_200_OK)
def delete_all_schedules(db: Session = Depends(get_db)):
    """
    Delete all schedules
    """
    return service.delete_all_schedules(db)
