import { Schedule } from '../types';
import {
  Table,
  TableBody,
  TableCell,
  TableContainer,
  TableHead,
  TableRow,
  Paper,
  Container
} from '@mui/material';

interface ScheduleTableProps {
  schedule: Schedule;
}

export default function ScheduleTable({ schedule }: ScheduleTableProps) {
  const timeSlots = Array.from(
    new Set(schedule.scheduled_slots.map(slot => slot.assistant_availability.time_slot.id.split(", ")[1]))
  ).sort();

  const days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'];
  const columns = days.flatMap(day => [`${day} Primary`, `${day} Secondary`]);

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
    const column = slot.is_remote ? `${day} Secondary` : `${day} Primary`;
    tableData[timeSlot][column] = nickname;
  });

  return (
    <Container>
      <TableContainer component={Paper}>
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
    </Container>
  );
}
