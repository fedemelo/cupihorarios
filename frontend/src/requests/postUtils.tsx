import React from 'react';
import axios from 'axios';

export interface Availability {
  assistant_code: number;
  remote_only: boolean;
  time_slot_id: string;
}

interface ScheduleSelectorProps {
  availabilities: Availability[];
}

const deleteAssistantAvailability = async (assistant_code: number) => {
  try {
    const response = await axios.delete(`http://localhost:8003/v1.0/assistant-availability/assistant/${assistant_code}`);
    console.log('Delete Response:', response.data);
    return response.data;
  } catch (error) {
    console.error('Error deleting assistant availability:', error);
    throw error;
  }
};

export const postAssistantAvailability = async (availabilities: Availability[]) => {
  const assistantCode = availabilities[0].assistant_code; // Assuming all availabilities have the same assistant code
  try {
    // First, delete the existing availability for the assistant
    await deleteAssistantAvailability(assistantCode);
    
    // Then, post the new availabilities
    const response = await axios.post('http://localhost:8003/v1.0/assistant-availability/many', availabilities);
    console.log('Post Response:', response.data);
    return response.data;
  } catch (error) {
    console.error('Error posting assistant availability:', error);
    throw error;
  }
};

const ScheduleSelector: React.FC<ScheduleSelectorProps> = ({ availabilities }) => {
  const handlePostAvailability = async () => {
    try {
      const result = await postAssistantAvailability(availabilities);
      console.log('Availability posted successfully:', result);
    } catch (error) {
      console.error('Failed to post availability:', error);
    }
  };

  return (
    <div>
      <button onClick={handlePostAvailability}>Post Availability</button>
    </div>
  );
};

export default ScheduleSelector;

