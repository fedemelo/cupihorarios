from src.schemas.assistant_availability import AssistantAvailabilityCreate, AssistantAvailabilityUpdate, AssistantAvailabilityResponse
from fastapi import APIRouter, Depends, HTTPException, Body, status
from src.routers.assistant import check_assistant_exists
import src.services.assistant_availability as service
from src.exceptions import ITEM_NOT_FOUND
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


@router.get("/assistant/{assistant_code}", response_model=list[AssistantAvailabilityResponse], status_code=status.HTTP_200_OK)
def read_an_assistants_availabilities(assistant_code: int, db: Session = Depends(get_db)):
    """
    Retrieve an assistant's availabilities by their code
    """
    check_assistant_exists(assistant_code, db)
    return service.get_an_assistants_availabilities(db, assistant_code)


@router.get("/", response_model=list[AssistantAvailabilityResponse], status_code=status.HTTP_200_OK)
def read_all_assistants_availabilities(skip: int = 0, limit: int = 100, db: Session = Depends(get_db)):
    """
    Retrieve all assistant availabilities
    """
    return service.get_all_assistants_availabilities(db, skip, limit)


@router.post("/", response_model=AssistantAvailabilityResponse, status_code=status.HTTP_201_CREATED)
def create_assistant_availability(assistant_availability: AssistantAvailabilityCreate = Body(...), db: Session = Depends(get_db)):
    """
    Create a new assistant availability
    """
    return service.create_assistant_availability(db, assistant_availability)


@router.post("/many", response_model=list[AssistantAvailabilityResponse], status_code=status.HTTP_201_CREATED)
def create_many_assistant_availabilities(assistant_availabilities: list[AssistantAvailabilityCreate], db: Session = Depends(get_db)):
    """
    Create many assistant availabilities
    """
    return service.create_many_assistant_availabilities(db, assistant_availabilities)


@router.put("/{assistant_availability_id}", response_model=AssistantAvailabilityResponse, status_code=status.HTTP_200_OK)
def update_assistant_availability(assistant_availability_id: UUID, assistant_availability: AssistantAvailabilityUpdate = Body(...), db: Session = Depends(get_db)):
    """
    Update an existing assistant availability
    """
    if not service.get_assistant_availability_by_id(db, assistant_availability_id):
        raise HTTPException(status_code=404, detail=ITEM_NOT_FOUND.format(
            NAME, "ID", assistant_availability_id))
    return service.update_assistant_availability(db, assistant_availability_id, assistant_availability)


@router.delete("/assistant_availability/{assistant_availability_id}", response_model=Dict[str, str], status_code=status.HTTP_200_OK)
def delete_assistant_availability(assistant_availability_id: UUID, db: Session = Depends(get_db)):
    """
    Delete an existing assistant availability
    """
    if not service.get_assistant_availability_by_id(db, assistant_availability_id):
        raise HTTPException(status_code=404, detail=ITEM_NOT_FOUND.format(
            NAME, "ID", assistant_availability_id))
    return service.delete_assistant_availability(db, assistant_availability_id)


@router.delete("/assistant/{assistant_code}", response_model=Dict[str, str], status_code=status.HTTP_200_OK)
def delete_an_assistants_availabilities(assistant_code: int, db: Session = Depends(get_db)):
    """
    Delete an assistant's availabilities by their code
    """
    check_assistant_exists(assistant_code, db)
    return service.delete_an_assistants_availabilities(db, assistant_code)


@router.delete("/", response_model=Dict[str, str], status_code=status.HTTP_200_OK)
def delete_all_assistant_availabilities(db: Session = Depends(get_db)):
    """
    Delete all assistant availabilities
    """
    return service.delete_all_assistant_availabilities(db)
