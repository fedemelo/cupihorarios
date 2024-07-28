from fastapi import APIRouter, Depends, HTTPException, Response, status
from src.schemas.schedule import FullScheduleResponse
from src.exceptions import ITEM_NOT_FOUND
import src.services.schedule as service
from src.config.db_config import get_db
from sqlalchemy.orm import Session
from uuid import UUID


router = APIRouter(
    prefix="/official_schedule",
    tags=["official_schedule"],
    responses={404: {"detail": "Not found"}},
)


NAME: str = "Official schedule"


@router.get("/", response_model=FullScheduleResponse, status_code=status.HTTP_200_OK)
def read_official_schedule(db: Session = Depends(get_db)):
    """
    Retrieve the official schedule
    """
    if not (schedule := service.get_official_schedule(db)):
        raise HTTPException(status_code=404, detail=ITEM_NOT_FOUND.format(
            NAME, "is_official", "True"))
    return schedule


@router.get("/download/{schedule_id}", status_code=status.HTTP_200_OK)
def download_schedule_as_excel_route(schedule_id: UUID, db: Session = Depends(get_db)):
    """
    Download a schedule as an Excel file
    """
    if not (schedule := service.get_schedule_by_id(db, schedule_id)):
        raise HTTPException(
            status_code=404, detail=f"Schedule with ID {schedule_id} not found")

    excel_file = service.download_schedule_as_excel(schedule)
    return Response(
        content=excel_file,
        media_type="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
        headers={
            "Content-Disposition": f"attachment; filename=schedule_{schedule_id}.xlsx"}
    )


@router.put("/{schedule_id}", response_model=FullScheduleResponse, status_code=status.HTTP_200_OK)
def set_schedule_as_official(schedule_id: UUID, db: Session = Depends(get_db)):
    """
    Set a schedule as official
    """
    if not service.get_schedule_by_id(db, schedule_id):
        raise HTTPException(status_code=404, detail=ITEM_NOT_FOUND.format(
            NAME, "ID", schedule_id))
    return service.set_schedule_as_official(db, schedule_id)
