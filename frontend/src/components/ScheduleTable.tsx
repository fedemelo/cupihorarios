import React from 'react';
import { useTable, Column } from 'react-table';
import {
  Table,
  TableBody,
  TableCell,
  TableContainer,
  TableHead,
  TableRow,
  Paper,
  Typography,
  Box,
} from '@mui/material';
import styled from 'styled-components';

interface AssistantAvailability {
  assistant: {
    nickname: string;
  };
  time_slot: {
    start_hour: string;
  };
}

interface ScheduledSlot {
  assistant_availability: AssistantAvailability;
}

interface Schedule {
  scheduled_slots: ScheduledSlot[];
}

interface ScheduleRow {
  Day: string;
  Time_Slot: string;
  Presencial: string;
  Remoto: string;
  Combined: string;
}

interface ScheduleTableProps {
  schedule: Schedule;
  horarios: string[];
  dias: string[];
}

const extractScheduledSlots = (schedule: Schedule): ScheduledSlot[] => {
  return schedule.scheduled_slots;
};

const createScheduleRows = (scheduled_slots: ScheduledSlot[], horarios: string[], dias: string[]): ScheduleRow[] => {
  let rows: ScheduleRow[] = [];
  for (let i = 0; i < scheduled_slots.length; i += 2) {
    let entry1 = scheduled_slots[i];
    let entry2 = scheduled_slots[i + 1];

    let assistant1 = entry1.assistant_availability.assistant.nickname;
    let assistant2 = entry2.assistant_availability.assistant.nickname;

    let time_slot = horarios[Math.floor(i / 2) % horarios.length];
    let day = dias[Math.floor(i / 2 / horarios.length)];

    rows.push({
      Day: day,
      Time_Slot: time_slot,
      Presencial: `P: ${assistant1}`,
      Remoto: `R: ${assistant2}`,
      Combined: `P: ${assistant1}\nR: ${assistant2}`
    });
  }
  return rows;
};

const createScheduleTableData = (rows: ScheduleRow[], dias: string[]) => {
  let data: Record<string, any>[] = [];
  let columns: Column<ScheduleRow>[] = [
    {
      Header: 'Time Slot',
      accessor: 'Time_Slot'
    }
  ];

  dias.forEach(day => {
    columns.push({
      Header: day,
      accessor: day,
      Cell: ({ cell: { value } }) => (
        <div>
          {value.split('\n').map((text: string, index: number) => (
            <div key={index}>{text}</div>
          ))}
        </div>
      )
    });
  });

  rows.forEach(row => {
    let existingRow = data.find(d => d.Time_Slot === row.Time_Slot);
    if (existingRow) {
      existingRow[row.Day] = row.Combined;
    } else {
      let newRow: Record<string, any> = { Time_Slot: row.Time_Slot };
      newRow[row.Day] = row.Combined;
      data.push(newRow);
    }
  });

  return { columns, data };
};

const StyledTableCell = styled(TableCell)`
  white-space: pre-line;
`;

const ScheduleTable: React.FC<ScheduleTableProps> = ({ schedule, horarios, dias }) => {
  const scheduled_slots = extractScheduledSlots(schedule);
  const rows = createScheduleRows(scheduled_slots, horarios, dias);
  const { columns, data } = createScheduleTableData(rows, dias);

  const {
    getTableProps,
    getTableBodyProps,
    headerGroups,
    rows: tableRows,
    prepareRow
  } = useTable({ columns, data });

  return (
    <TableContainer component={Paper}>
      <Table {...getTableProps()}>
        <TableHead>
          {headerGroups.map(headerGroup => (
            <TableRow {...headerGroup.getHeaderGroupProps()}>
              {headerGroup.headers.map(column => (
                <StyledTableCell {...column.getHeaderProps()} align="center">
                  <Typography variant="body1" fontWeight="bold">
                    {column.render('Header')}
                  </Typography>
                </StyledTableCell>
              ))}
            </TableRow>
          ))}
        </TableHead>
        <TableBody {...getTableBodyProps()}>
          {tableRows.map(row => {
            prepareRow(row);
            return (
              <TableRow {...row.getRowProps()}>
                {row.cells.map(cell => (
                  <StyledTableCell {...cell.getCellProps()} align="center">
                    <Box>
                      {cell.render('Cell')}
                    </Box>
                  </StyledTableCell>
                ))}
              </TableRow>
            );
          })}
        </TableBody>
      </Table>
    </TableContainer>
  );
};

export default ScheduleTable;
