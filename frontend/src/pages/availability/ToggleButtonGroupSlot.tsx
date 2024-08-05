import React from 'react';
import { ToggleButton, ToggleButtonGroup } from '@mui/material';
import { PersonPinCircle, Laptop } from '@mui/icons-material';
import { postAvailability } from '../../requests/postUtils';
import { deleteAvailability } from '../../requests/deleteUtils';
import { updateAvailability } from '../../requests/putUtils';

interface SlotAvailability {
  id: string;
  local: boolean;
  remote: boolean;
}

interface ToggleButtonGroupSlotProps {
  assistantCode: number;
  slotId: string;
  selectedSlot?: SlotAvailability;
  handleSelectionChange: (slotId: string, newSelection: string[]) => void;
}

export default function ToggleButtonGroupSlot ({
  assistantCode,
  slotId,
  selectedSlot,
  handleSelectionChange
}: ToggleButtonGroupSlotProps) {

  const handleButtonGroupChange = async (_event: React.MouseEvent<HTMLElement>, newSelection: string[]) => {
    const localSelected = newSelection.includes('local');
    const remoteSelected = newSelection.includes('remote');

    if (localSelected && !remoteSelected) {
      newSelection = ['local', 'remote'];
    }

    if (selectedSlot && selectedSlot.local && selectedSlot.remote && !remoteSelected) {
      newSelection = [];
    }

    const updatedSlot = selectedSlot
      ? {
          ...selectedSlot,
          local: newSelection.includes('local'),
          remote: newSelection.includes('remote'),
        }
      : {
          id: slotId,
          local: newSelection.includes('local'),
          remote: newSelection.includes('remote'),
        };

    if (!selectedSlot?.local && !selectedSlot?.remote && (updatedSlot.local || updatedSlot.remote)) {
      postAvailability({ assistant_code: assistantCode, remote_only: !updatedSlot.local, time_slot_id: slotId });
    } else if ((selectedSlot?.local || selectedSlot?.remote) && !updatedSlot.local && !updatedSlot.remote) {
      deleteAvailability({ assistant_code: assistantCode, remote_only: !selectedSlot.local, time_slot_id: slotId });
    } else {
      updateAvailability({ assistant_code: assistantCode, remote_only: !updatedSlot.local, time_slot_id: slotId });
    }

    handleSelectionChange(slotId, newSelection);
  };

  return (
    <ToggleButtonGroup
      value={
        selectedSlot
          ? [
              ...(selectedSlot.local ? ['local'] : []),
              ...(selectedSlot.remote ? ['remote'] : []),
            ]
          : []
      }
      onChange={handleButtonGroupChange}
      aria-label="availability"
      sx={{ width: '100%' }}
    >
      <ToggleButton
        value="local"
        aria-label="local availability"
        sx={{
          backgroundColor: selectedSlot?.local ? '#b8b8ff' : 'transparent',
          '&.Mui-selected': {
            backgroundColor: (theme) => theme.palette.secondary.main,
            color: '#fff'
          }
        }}
      >
        <PersonPinCircle />
      </ToggleButton>
      <ToggleButton
        value="remote"
        aria-label="remote availability"
        sx={{
          backgroundColor: selectedSlot?.remote ? '#b8b8ff' : 'transparent',
          '&.Mui-selected': {
            backgroundColor: '#465157',
            color: '#fff'
          }
        }}
      >
        <Laptop />
      </ToggleButton>
    </ToggleButtonGroup>
  );
}
