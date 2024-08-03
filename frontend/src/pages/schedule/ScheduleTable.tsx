import { useState } from 'react';
import { Schedule } from '../../types';
import {
  Table,
  TableBody,
  TableCell,
  TableContainer,
  TableHead,
  TableRow,
  Paper,
  Typography,
  Stack
} from '@mui/material';
import RemoteLocalToggleButtons from './RemoteLocalToggleButtons';
import { LocationType } from '../../types';
import Title from '../../components/Title';
import DownloadFromExcelButton from './DownloadFromExcelButton';

interface ScheduleTableProps {
  schedule: Schedule;
}

export default function ScheduleTable({ schedule }: ScheduleTableProps) {
  const [filters, setFilters] = useState<(LocationType)[]>(['local', 'remote']);

  const timeSlots = Array.from(
    new Set(schedule.scheduled_slots.map(slot => slot.assistant_availability.time_slot.id.split(", ")[1]))
  ).sort();

  const days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'];
  const columns = days.flatMap(day => [day]);

  const createEmptyTable = () => {
    const table: Record<string, Record<string, string>> = {};
    timeSlots.forEach(slot => {
      table[slot] = {};
      columns.forEach(col => {
        table[slot][col] = '';
      });
    });
    return table;
  };

  const tableData = createEmptyTable();

  schedule.scheduled_slots.forEach(slot => {
    const timeSlot = slot.assistant_availability.time_slot.id.split(", ")[1];
    const day = slot.assistant_availability.time_slot.day;
    const nickname = slot.assistant_availability.assistant.nickname;

    if ((filters.includes('local') && !slot.is_remote) || (filters.includes('remote') && slot.is_remote)) {
      const currentCell = tableData[timeSlot][day];
      const newCellContent = currentCell
        ? `${currentCell} - ${nickname}`
        : nickname;
      tableData[timeSlot][day] = newCellContent;
    }
  });

  return (
    <Stack spacing={1}>
      <Title>
        Horario Asistentes 2024-20
      </Title>
      <Typography variant="body1" sx={{ textAlign: 'justify' }}>
        El horario mostrado a continuación es una de las posibles configuraciones óptimas de horarios para los asistentes, que ha sido elegida para ser el horario oficial. Puedes leer los parámetros que se utilizan para generar el horario <a href="/docs">aquí</a>. Si tu disponibilidad cambió posterior a la generación del horario oficial, por favor actualízala en la pestaña de Disponibilidad e infórmalo a través de SMIP. Un administrador generará un nuevo horario basado en esta actualización, lo que probablemente modifique el horario de otros asistentes.
      </Typography>
      <Stack direction="row" spacing={1} justifyContent="space-around">
        <RemoteLocalToggleButtons filters={filters} setFilters={setFilters} />
        <DownloadFromExcelButton scheduleId={schedule.id} />
      </Stack>
      <TableContainer component={Paper} sx={{ padding: '16px' }}>
        <Table>
          <TableHead>
            <TableRow>
              <TableCell sx={{ width: '20%' }}>Time Slot</TableCell>
              {columns.map(column => (
                <TableCell key={column} sx={{ width: '8%' }}>{column}</TableCell>
              ))}
            </TableRow>
          </TableHead>
          <TableBody>
            {timeSlots.map(timeSlot => (
              <TableRow key={timeSlot}>
                <TableCell sx={{ width: '20%' }}>{timeSlot}</TableCell>
                {columns.map(column => (
                  <TableCell key={column} sx={{ width: '8%' }}>{tableData[timeSlot][column]}</TableCell>
                ))}
              </TableRow>
            ))}
          </TableBody>
        </Table>
      </TableContainer>
    </Stack>
  );
}
