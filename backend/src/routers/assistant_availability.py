from src.schemas.assistant_availability import AssistantAvailabilityCreate, AssistantAvailabilityUpdate, AssistantAvailabilityResponse
from src.exceptions import ITEM_NOT_FOUND
from fastapi import APIRouter, Depends, HTTPException, Body, status
import src.services.assistant_availability as service
from src.config.db_config import get_db
from sqlalchemy.orm import Session
from typing import Dict
from uuid import UUID


router = APIRouter(
    prefix="/assistant-availability",
    tags=["assistant_availability"],
    responses={404: {"detail": "Not found"}},
)


NAME: str = "Assistant Availability"


@router.get("/{assistant_availability_id}", response_model=AssistantAvailabilityResponse, status_code=status.HTTP_200_OK)
def read_assistant_availability_by_id(assistant_availability_id: UUID, db: Session = Depends(get_db)):
    """
    Retrieve an assistant availability by its ID
    """
    if not (assistant_availability := service.get_assistant_availability_by_id(db, assistant_availability_id)):
        raise HTTPException(status_code=404, detail=ITEM_NOT_FOUND.format(
            NAME, "ID", assistant_availability_id))
    return assistant_availability


@router.post("/", response_model=AssistantAvailabilityResponse, status_code=status.HTTP_201_CREATED)
def create_assistant_availability(assistant_availability: AssistantAvailabilityCreate = Body(...), db: Session = Depends(get_db)):
    """
    Create a new assistant availability
    """
    return service.create_assistant_availability(db, assistant_availability)


@router.put("/{assistant_availability_id}", response_model=AssistantAvailabilityResponse, status_code=status.HTTP_200_OK)
def update_assistant_availability(assistant_availability_id: UUID, assistant_availability: AssistantAvailabilityUpdate = Body(...), db: Session = Depends(get_db)):
    """
    Update an existing assistant availability
    """
    if not service.get_assistant_availability_by_id(db, assistant_availability_id):
        raise HTTPException(status_code=404, detail=ITEM_NOT_FOUND.format(
            NAME, "ID", assistant_availability_id))
    return service.update_assistant_availability(db, assistant_availability_id, assistant_availability)


@router.delete("/{assistant_availability_id}", response_model=Dict[str, str], status_code=status.HTTP_200_OK)
def delete_assistant_availability(assistant_availability_id: UUID, db: Session = Depends(get_db)):
    """
    Delete an existing assistant availability
    """
    if not service.get_assistant_availability_by_id(db, assistant_availability_id):
        raise HTTPException(status_code=404, detail=ITEM_NOT_FOUND.format(
            NAME, "ID", assistant_availability_id))
    return service.delete_assistant_availability(db, assistant_availability_id)
