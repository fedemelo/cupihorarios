import { useState } from 'react';
import { Schedule } from '../types';
import {
  Table,
  TableBody,
  TableCell,
  TableContainer,
  TableHead,
  TableRow,
  Paper,
  Container,
  ToggleButton,
  ToggleButtonGroup
} from '@mui/material';
import PersonPinCircle from '@mui/icons-material/PersonPinCircle';

interface ScheduleTableProps {
  schedule: Schedule;
}

export default function ScheduleTable({ schedule }: ScheduleTableProps) {
  const [filters, setFilters] = useState<('local' | 'remote')[]>(['local', 'remote']); // Allow multiple selections

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

    if (filters.includes('both') || (filters.includes('local') && !slot.is_remote) || (filters.includes('remote') && slot.is_remote)) {
      const currentCell = tableData[timeSlot][day];
      const newCellContent = currentCell
        ? `${currentCell} - ${nickname}`
        : nickname;
      tableData[timeSlot][day] = newCellContent;
    }
  });

  return (
    <Container sx={{ padding: '16px', maxWidth: '1200px', margin: 'auto' }}>
      <TableContainer component={Paper} sx={{ padding: '16px', backgroundColor: '#f9f9f9' }}> {/* Background color for table */}
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
      <ToggleButtonGroup
        value={filters}
        onChange={(event, newFilters) => setFilters(newFilters)}
        sx={{ marginTop: '16px', display: 'flex', justifyContent: 'center' }}
      >
        <ToggleButton
          value="local"
          aria-label="local availability"
          sx={{
            backgroundColor: filters.includes('local') ? '#b8b8ff' : 'transparent',
            '&.Mui-selected': {
              backgroundColor: (theme) => theme.palette.secondary.main,
              color: '#fff'
            }
          }}
        >
          Local
        </ToggleButton>
        <ToggleButton
          value="remote"
          aria-label="remote availability"
          sx={{
            backgroundColor: filters.includes('remote') ? '#b8b8ff' : 'transparent',
            '&.Mui-selected': {
              backgroundColor: (theme) => theme.palette.secondary.main,
              color: '#fff'
            }
          }}
        >
          Remote
        </ToggleButton>
      </ToggleButtonGroup>
    </Container>
  );
}
