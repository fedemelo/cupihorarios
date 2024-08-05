import {axiosInstance} from './utils';
import { deleteAllAssistantAvailabilities } from './deleteUtils';
import { AssistantAvailabilityBase } from './utils';


export const postAssistantAvailabilities = async (availabilities: AssistantAvailabilityBase[]) => {
  const assistantCode = availabilities[0].assistant_code;
  try {
    await deleteAllAssistantAvailabilities(assistantCode);
    
    const response = await axiosInstance.post('/assistant-availability/many', availabilities);
    console.log('Post Response:', response.data);
    return response.data;
  } catch (error: any) {
    console.error('Error posting assistant availability:', error.response ? error.response.data : error.message);
    throw error;
  }
};


export const postAvailability = async (availability: AssistantAvailabilityBase) => {
  try {
    const response = await axiosInstance.post('/assistant-availability/', availability);
    console.log('Post Response:', response.data);
    return response.data;
  } catch (error: any) {
    console.error('Error posting assistant availability:', error.response ? error.response.data : error.message);
    throw error;
  }
}


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
