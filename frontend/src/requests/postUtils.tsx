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
  const assistantCode = availabilities[0].assistant_code;
  try {
    await deleteAssistantAvailability(assistantCode);
    
    const response = await axiosInstance.post('/assistant-availability/many', availabilities);
    console.log('Post Response:', response.data);
    return response.data;
  } catch (error: any) {
    console.error('Error posting assistant availability:', error.response ? error.response.data : error.message);
    throw error;
  }
};


export const createNewSchedule = async (name: string) => {
  try {
    const response = await axiosInstance.post('/schedule/', {
      is_official: false,
      name: name,
    });
    
    console.log('Nuevo horario creado:', response.data);
    return response.data;
  } catch (error) {
    console.error('Error al crear un nuevo horario:', error);
    throw error;
  }
};
