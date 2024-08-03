from sqlalchemy import Column, Boolean, UUID, ForeignKey, String
from sqlalchemy.orm import relationship
from src.config.db_config import Base
from uuid import uuid4


class ScheduledSlot(Base):
    """
    Model for the scheduled_slots table.
    """
    __tablename__ = "scheduled_slots"

    schedule_id = Column(UUID(as_uuid=True), ForeignKey(
        'schedules.id'), primary_key=True, default=uuid4)
    assistant_availability_id = Column(String, ForeignKey('assistant_availabilities.id', ondelete='CASCADE'), primary_key=True)
    is_remote = Column(Boolean, nullable=False)

    schedule = relationship("Schedule", back_populates="scheduled_slots")
    assistant_availability = relationship(
        "AssistantAvailability", back_populates="scheduled_slots")
