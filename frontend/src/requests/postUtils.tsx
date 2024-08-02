import {axiosInstance} from './axiosInstanciator';

export interface Availability {
  assistant_code: number;
  remote_only: boolean;
  time_slot_id: string;
}

const deleteAssistantAvailability = async (assistant_code: number) => {
  try {
    const response = await axiosInstance.delete(`/assistant-availability/assistant/${assistant_code}`);
    console.log('Delete Response:', response.data);
    return response.data;
  } catch (error: any) {
    console.error('Error deleting assistant availability:', error.response ? error.response.data : error.message);
    throw error;
  }
};


export const postAssistantAvailability = async (availabilities: Availability[]) => {
  const assistantCode = availabilities[0].assistant_code; // Assuming all availabilities have the same assistant code
  try {
    // First, delete the existing availability for the assistant
    await deleteAssistantAvailability(assistantCode);
    
    // Then, post the new availabilities
    const response = await axiosInstance.post('/assistant-availability/many', availabilities);
    console.log('Post Response:', response.data);
    return response.data;
  } catch (error: any) {
    console.error('Error posting assistant availability:', error.response ? error.response.data : error.message);
    throw error;
  }
};
