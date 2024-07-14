from sqlalchemy import Column, Integer, Boolean, UUID, ForeignKey
from sqlalchemy.orm import relationship
from src.config.db_config import Base
import uuid


class AssistantAvailability(Base):
    """
    Model for the assistant_availabilities table.
    """
    __tablename__ = "assistant_availabilities"

    id = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    assistant_code = Column(Integer, ForeignKey(
        'assistants.code'), nullable=False)
    time_slot_id = Column(UUID(as_uuid=True), ForeignKey(
        'time_slots.id'), nullable=False)
    virtual_only = Column(Boolean, nullable=False)

    assistant = relationship(
        "Assistant", back_populates="assistant_availabilities")
    time_slot = relationship(
        "TimeSlot", back_populates="assistant_availabilities")
    scheduled_slots = relationship(
        "ScheduledSlot", back_populates="assistant_availability")
