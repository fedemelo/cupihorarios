export interface TimeSlot {
  start_hour: number;
  end_hour: number;
  day: string;
  id: string;
}

export const fetchTimeSlots = async (): Promise<TimeSlot[]> => {
  try {
      const response = await fetch("http://localhost:8003/v1.0/time-slot/");
      if (response.ok) {
          return await response.json();
      } else {
          console.error(`Error fetching time slots: ${response.status}`);
          return [];
      }
  } catch (error) {
      console.error(`Error fetching time slots: ${(error as Error).message}`);
      return [];
  }
};
