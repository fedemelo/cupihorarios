
import { axiosInstance } from './axiosInstanciator';
import { saveAs } from 'file-saver';


export const downloadScheduleAsExcel = async (schedule_id: string) => {
  try {
    const response = await axiosInstance.get(`/schedule/download/${schedule_id}`, {
      responseType: 'blob',
    });

    const blob = new Blob([response.data], { type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' });

    saveAs(blob, `CupiHorario.xlsx`);

    console.log('Archivo descargado exitosamente.');
  } catch (error) {
    console.error('Error al descargar el archivo:', error);
  }
};
