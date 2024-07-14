from sqlalchemy import Column, Boolean, UUID, ForeignKey
from sqlalchemy.orm import relationship
from src.config.db_config import Base
import uuid


class ScheduledSlot(Base):
    """
    Model for the scheduled_slots table.
    """
    __tablename__ = "scheduled_slots"

    schedule_id = Column(UUID(as_uuid=True), ForeignKey(
        'schedules.id'), primary_key=True, default=uuid.uuid4)
    assistant_availability_id = Column(UUID(as_uuid=True), ForeignKey(
        'assistant_availabilities.id'), primary_key=True, default=uuid.uuid4)
    is_virtual = Column(Boolean, nullable=False)

    schedule = relationship("Schedule", back_populates="scheduled_slots")
    assistant_availability = relationship(
        "AssistantAvailability", back_populates="scheduled_slots")
