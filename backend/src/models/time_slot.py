from sqlalchemy import Column, Integer, String, Enum as SQLAEnum
from sqlalchemy.orm import relationship
from src.config.db_config import Base
from enum import Enum


class Day(Enum):
    MONDAY = "Monday"
    TUESDAY = "Tuesday"
    WEDNESDAY = "Wednesday"
    THURSDAY = "Thursday"
    FRIDAY = "Friday"
    SATURDAY = "Saturday"
    SUNDAY = "Sunday"


class TimeSlot(Base):
    """
    Model for the time_slots table.
    """
    __tablename__ = "time_slots"

    id = Column(String, primary_key=True)
    start_hour = Column(Integer, nullable=False)
    end_hour = Column(Integer, nullable=False)
    day = Column(SQLAEnum(Day), nullable=False)

    assistant_availabilities = relationship(
        "AssistantAvailability", back_populates="time_slot")

    def build_time_slot_id(day: Day, start_hour: int, end_hour: int) -> str:
        """E.g.: 'Friday, 16:30-17:00' """
        return f"{day.value}, {start_hour // 100:02}:{start_hour % 100:02}-{end_hour // 100:02}:{end_hour % 100:02}"

    def __str__(self):
        return TimeSlot.build_time_slot_id(self.day, self.start_hour, self.end_hour)
