import Button from '@mui/material/Button';
import { downloadScheduleAsExcel } from '../../requests/downloadUtils.tsx';

export default function DownloadFromExcelButton({ scheduleId }: { scheduleId: string }) {
  const handleDownload = () => {
    downloadScheduleAsExcel(scheduleId);
  };

  return (
    <Button variant="contained" color="primary" onClick={handleDownload} sx={{ textTransform: 'none' }}>
      Descargar horario en Excel
    </Button>
  );
}
