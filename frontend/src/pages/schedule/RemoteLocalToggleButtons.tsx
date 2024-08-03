import { ToggleButtonGroup, ToggleButton } from '@mui/material';
import PersonPinCircleIcon from '@mui/icons-material/PersonPinCircle';
import LaptopIcon from '@mui/icons-material/Laptop';
import { LocationType } from '../../types';


interface RemoteLocalToggleButtonsProps {
  filters: LocationType[];
  setFilters: (filters: LocationType[]) => void;
}

export default function RemoteLocalToggleButtons({ filters, setFilters }: RemoteLocalToggleButtonsProps) {
  const options: { value: LocationType; label: string; icon: JSX.Element }[] = [
    { value: 'local', label: 'Presencial', icon: <PersonPinCircleIcon /> },
    { value: 'remote', label: 'Remoto', icon: <LaptopIcon /> }
  ];
  
  return (
    <ToggleButtonGroup
      value={filters}
      onChange={(_event, newFilters) => setFilters(newFilters)}
      sx={{ marginTop: '16px', display: 'flex', justifyContent: 'center' }}
    >
      {options.map((option) => (
        <ToggleButton
          key={option.value}
          value={option.value}
          aria-label={`${option.value} availability`}
          sx={{
            backgroundColor: filters.includes(option.value) ? '#b8b8ff' : 'transparent',
            '&.Mui-selected': {
              backgroundColor: (theme) => theme.palette.primary.main,
              color: '#fff'
            }
          }}
        >
          {option.icon}
          {option.label}
        </ToggleButton>
      ))}
    </ToggleButtonGroup>
  );
}
