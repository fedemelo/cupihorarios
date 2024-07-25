from src.schemas.scheduled_slot import ScheduledSlotCreate, ScheduledSlotUpdate, ScheduledSlotResponse
from fastapi import APIRouter, Depends, HTTPException, Body, status
import src.services.scheduled_slot as service
from src.exceptions import ITEM_NOT_FOUND
from src.config.db_config import get_db
from sqlalchemy.orm import Session
from typing import Dict, List
from uuid import UUID


router = APIRouter(
    prefix="/scheduled-slot",
    tags=["scheduled_slot"],
    responses={404: {"detail": "Not found"}},
)


NAME: str = "Scheduled Slot"


@router.get("/{schedule_id}/{assistant_availability_id}", response_model=ScheduledSlotResponse, status_code=status.HTTP_200_OK)
def read_scheduled_slot(schedule_id: UUID, assistant_availability_id: UUID, db: Session = Depends(get_db)):
    """
    Retrieve a scheduled slot by its schedule ID and assistant availability ID
    """
    if not (scheduled_slot := service.get_scheduled_slot(db, schedule_id, assistant_availability_id)):
        raise HTTPException(status_code=404, detail=ITEM_NOT_FOUND.format(
            NAME, "ID", f"{schedule_id}/{assistant_availability_id}"))
    return scheduled_slot


@router.get("/", response_model=List[ScheduledSlotResponse], status_code=status.HTTP_200_OK)
def read_scheduled_slots(skip: int = 0, limit: int = 100, db: Session = Depends(get_db)):
    """
    Retrieve all scheduled slots
    """
    return service.get_scheduled_slots(db, skip, limit)


@router.post("/", response_model=ScheduledSlotResponse, status_code=status.HTTP_201_CREATED)
def create_scheduled_slot(scheduled_slot: ScheduledSlotCreate = Body(...), db: Session = Depends(get_db)):
    """
    Create a new scheduled slot
    """
    return service.create_scheduled_slot(db, scheduled_slot)


@router.put("/{schedule_id}/{assistant_availability_id}", response_model=ScheduledSlotResponse, status_code=status.HTTP_200_OK)
def update_scheduled_slot(schedule_id: UUID, assistant_availability_id: UUID, scheduled_slot: ScheduledSlotUpdate = Body(...), db: Session = Depends(get_db)):
    """
    Update an existing scheduled slot
    """
    if not service.get_scheduled_slot(db, schedule_id, assistant_availability_id):
        raise HTTPException(status_code=404, detail=ITEM_NOT_FOUND.format(
            NAME, "ID", f"{schedule_id}/{assistant_availability_id}"))
    return service.update_scheduled_slot(db, schedule_id, assistant_availability_id, scheduled_slot)


@router.delete("/{schedule_id}/{assistant_availability_id}", response_model=Dict[str, str], status_code=status.HTTP_200_OK)
def delete_scheduled_slot(schedule_id: UUID, assistant_availability_id: UUID, db: Session = Depends(get_db)):
    """
    Delete an existing scheduled slot
    """
    if not service.get_scheduled_slot(db, schedule_id, assistant_availability_id):
        raise HTTPException(status_code=404, detail=ITEM_NOT_FOUND.format(
            NAME, "ID", f"{schedule_id}/{assistant_availability_id}"))
    return service.delete_scheduled_slot(db, schedule_id, assistant_availability_id)


@router.delete("/", response_model=Dict[str, str], status_code=status.HTTP_200_OK)
def delete_all_scheduled_slots(db: Session = Depends(get_db)):
    """
    Delete all scheduled slots
    """
    return service.delete_all_scheduled_slots(db)
