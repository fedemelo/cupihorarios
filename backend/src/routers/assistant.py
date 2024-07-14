from src.schemas.assistant import AssistantCreate, AssistantUpdate, AssistantResponse
from src.exceptions import ITEM_NOT_FOUND, ITEM_ALREADY_EXISTS
from fastapi import APIRouter, Depends, HTTPException, Body, status
import src.services.assistant as service
from src.config.db_config import get_db
from sqlalchemy.orm import Session
from typing import Dict


router = APIRouter(
    prefix="/assistant",
    tags=["assistant"],
    responses={404: {"detail": "Not found"}},
)


NAME: str = "Assistant"


@router.get("/by_code/{assistant_code}", response_model=AssistantResponse, status_code=status.HTTP_200_OK)
def read_assistant_by_code(assistant_code: int, db: Session = Depends(get_db)):
    """
    Retrieve a assistant by its code
    """
    if not (assistant := service.get_assistant_by_code(db, assistant_code)):
        raise HTTPException(status_code=404, detail=ITEM_NOT_FOUND.format(
            NAME, "code", assistant_code))
    return assistant


@router.get("/by_login/{assistant_login}", response_model=AssistantResponse, status_code=status.HTTP_200_OK)
def read_assistant_by_login(assistant_login: str, db: Session = Depends(get_db)):
    """
    Retrieve a assistant by its login
    """
    if not (assistant := service.get_assistant_by_login(db, assistant_login)):
        raise HTTPException(status_code=404, detail=ITEM_NOT_FOUND.format(
            NAME, "login", assistant_login))
    return assistant


@router.post("/", response_model=AssistantResponse, status_code=status.HTTP_201_CREATED)
def create_assistant(assistant: AssistantCreate = Body(...), db: Session = Depends(get_db)):
    """
    Create a new assistant
    """
    if service.get_assistant_by_code(db, assistant.code):
        raise HTTPException(status_code=400, detail=ITEM_ALREADY_EXISTS.format(
            NAME, "code", assistant.code))

    if service.get_assistant_by_login(db, assistant.login):
        raise HTTPException(status_code=400, detail=ITEM_ALREADY_EXISTS.format(
            NAME, "login", assistant.login))

    return service.create_assistant(db, assistant)


@router.put("/{assistant_code}", response_model=AssistantResponse, status_code=status.HTTP_200_OK)
def update_assistant(assistant_code: int, assistant: AssistantUpdate = Body(...), db: Session = Depends(get_db)):
    """
    Update an existing assistant
    """
    if not service.get_assistant_by_code(db, assistant_code):
        raise HTTPException(status_code=404, detail=ITEM_NOT_FOUND.format(
            NAME, "code", assistant_code))
    return service.update_assistant(db, assistant_code, assistant)


@router.delete("/{assistant_code}", response_model=Dict[str, str], status_code=status.HTTP_200_OK)
def delete_assistant(assistant_code: int, db: Session = Depends(get_db)):
    """
    Delete an existing assistant
    """
    if not service.get_assistant_by_code(db, assistant_code):
        raise HTTPException(status_code=404, detail=ITEM_NOT_FOUND.format(
            NAME, "code", assistant_code))
    return service.delete_assistant(db, assistant_code)
