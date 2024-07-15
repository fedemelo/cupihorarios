from src.schemas.time_slot import TimeSlotCreate, TimeSlotUpdate, TimeSlotResponse
from fastapi import APIRouter, Depends, HTTPException, Body, status
from src.exceptions import ITEM_NOT_FOUND
import src.services.time_slot as service
from src.config.db_config import get_db
from sqlalchemy.orm import Session
from typing import Dict, List
from uuid import UUID


router = APIRouter(
    prefix="/time-slot",
    tags=["time_slot"],
    responses={404: {"detail": "Not found"}},
)


NAME: str = "Time Slot"


@router.get("/{time_slot_id}", response_model=TimeSlotResponse, status_code=status.HTTP_200_OK)
def read_time_slot_by_id(time_slot_id: UUID, db: Session = Depends(get_db)):
    """
    Retrieve a time slot by its ID
    """
    if not (time_slot := service.get_time_slot_by_id(db, time_slot_id)):
        raise HTTPException(status_code=404, detail=ITEM_NOT_FOUND.format(
            NAME, "ID", time_slot_id))
    return time_slot


@router.get("/", response_model=List[TimeSlotResponse], status_code=status.HTTP_200_OK)
def read_time_slots(db: Session = Depends(get_db)):
    """
    Retrieve all time slots
    """
    return service.get_time_slots(db)


@router.post("/", response_model=TimeSlotResponse, status_code=status.HTTP_201_CREATED)
def create_time_slot(time_slot: TimeSlotCreate = Body(...), db: Session = Depends(get_db)):
    """
    Create a new time slot
    """
    return service.create_time_slot(db, time_slot)


@router.put("/{time_slot_id}", response_model=TimeSlotResponse, status_code=status.HTTP_200_OK)
def update_time_slot(time_slot_id: UUID, time_slot: TimeSlotUpdate = Body(...), db: Session = Depends(get_db)):
    """
    Update an existing time slot
    """
    if not service.get_time_slot_by_id(db, time_slot_id):
        raise HTTPException(status_code=404, detail=ITEM_NOT_FOUND.format(
            NAME, "ID", time_slot_id))
    return service.update_time_slot(db, time_slot_id, time_slot)


@router.delete("/{time_slot_id}", response_model=Dict[str, str], status_code=status.HTTP_200_OK)
def delete_time_slot(time_slot_id: UUID, db: Session = Depends(get_db)):
    """
    Delete an existing time slot
    """
    if not service.get_time_slot_by_id(db, time_slot_id):
        raise HTTPException(status_code=404, detail=ITEM_NOT_FOUND.format(
            NAME, "ID", time_slot_id))
    return service.delete_time_slot(db, time_slot_id)
