from sqlalchemy import Column, String, Boolean, UUID
from sqlalchemy.orm import relationship
from src.config.db_config import Base
from uuid import uuid4


class Schedule(Base):
    """
    Model for the schedules table.
    """
    __tablename__ = "schedules"

    id = Column(UUID(as_uuid=True), primary_key=True, default=uuid4)
    name = Column(String, nullable=False)
    is_official = Column(Boolean, nullable=False)

    scheduled_slots = relationship("ScheduledSlot", back_populates="schedule")
