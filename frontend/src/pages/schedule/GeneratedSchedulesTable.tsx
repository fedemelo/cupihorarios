import { Table, TableBody, TableCell, TableContainer, TableHead, TableRow, Paper, Typography, Stack, Button, Chip } from '@mui/material';
import { setOfficialSchedule as updateOfficialSchedule } from '../../requests/putUtils';
import { fetchAllSchedules } from '../../requests/fetchUtils';
import { deleteSchedule } from '../../requests/deleteUtils';
import GenerateNewSchedule from './GenerateNewSchedule';
import { useState, useEffect, Dispatch, SetStateAction } from 'react';
import { Schedule, ScheduleInfo } from '../../types';
import Title from '../../components/Title';

interface GeneratedSchedulesTableProps {
  isAdmin: boolean;
  adminView: boolean;
  officialSchedule: ScheduleInfo | undefined;
  setOfficialSchedule: Dispatch<SetStateAction<Schedule | undefined>>
}

export default function GeneratedSchedulesTable({ isAdmin, adminView, officialSchedule, setOfficialSchedule }: GeneratedSchedulesTableProps) {
  const [schedules, setSchedules] = useState<ScheduleInfo[]>([]);
  const [newScheduleAdded, setNewScheduleAdded] = useState(false);

  useEffect(() => {
    fetchAllSchedules().then((schedules: ScheduleInfo[]) => {
      setSchedules(schedules.sort((a, b) => a.id.localeCompare(b.id)));
    });
  }, [newScheduleAdded, officialSchedule]);

  function updateExistingSchedules() {
    setNewScheduleAdded(!newScheduleAdded);
  }

  const handleSetOfficialSchedule = async (scheduleId: string) => {
    try {
      const officialSchedule = await updateOfficialSchedule(scheduleId);
      if (officialSchedule) {
        setOfficialSchedule(officialSchedule);
        updateExistingSchedules();
      }
    } catch (error: any) {
      alert('Error al seleccionar el horario como oficial.');
    }
  };

  if (isAdmin && adminView) {
    return (
      <Stack spacing={1} alignItems={'center'}>
        <Title>Horarios de asistentes 2024-20</Title>
        {schedules.length ? (
          <TableContainer component={Paper} sx={{ maxWidth: '600px' }}>
            <Table>
              <TableHead>
                <TableRow key="header">
                  <TableCell>
                    <Typography variant="h6">Horarios</Typography>
                  </TableCell>
                  <TableCell align="center">
                    <Typography variant="h6">Estatus</Typography>
                  </TableCell>
                  <TableCell align="right">
                    <Typography variant="h6">Eliminar</Typography>
                  </TableCell>
                </TableRow>
              </TableHead>
              <TableBody>
                {schedules.map((schedule) => (
                  <TableRow key={schedule.id}>
                    <TableCell>{schedule.name}</TableCell>
                    <TableCell align='center'>
                      {schedule.is_official ? (
                        <Button
                          variant="contained"
                          color="primary"
                          onClick={() => handleSetOfficialSchedule(schedule.id)}
                          sx={{ textTransform: 'none' }}
                        >
                          Seleccionar como horario oficial
                        </Button>
                      ) : (
                        <Chip label="Horario oficial" color="secondary" />
                      )}
                    </TableCell>
                    <TableCell align='right'>
                      <Button
                        variant="contained"
                        color="error"
                        onClick={() => deleteSchedule(schedule.id).then(() => updateExistingSchedules())}
                        sx={{ textTransform: 'none' }}
                      >
                        Eliminar
                      </Button>
                    </TableCell>
                  </TableRow>
                ))}
              </TableBody>
            </Table>
          </TableContainer>
        ) : (
          <Typography variant="h4" align="center" marginBlock={5}>
            No se ha generado ningún horario aún.
          </Typography>
        )}
        <GenerateNewSchedule updateExistingSchedules={updateExistingSchedules} />
      </Stack>
    );
  }

  return null;
}
