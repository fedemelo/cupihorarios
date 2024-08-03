import { ToggleButtonGroup, ToggleButton, useTheme } from '@mui/material';
import PersonPinCircleIcon from '@mui/icons-material/PersonPinCircle';
import LaptopIcon from '@mui/icons-material/Laptop';
import { LocationType } from '../../types';


interface RemoteLocalToggleButtonsProps {
  filters: LocationType[];
  setFilters: (filters: LocationType[]) => void;
}

export default function RemoteLocalToggleButtons({ filters, setFilters }: RemoteLocalToggleButtonsProps) {

  const theme = useTheme();

  const options: { value: LocationType; label: string; icon: JSX.Element; backgroundColor: string }[] = [
    { value: 'local', label: 'Presencial', icon: <PersonPinCircleIcon />, backgroundColor: theme.palette.secondary.main },
    { value: 'remote', label: 'Remoto', icon: <LaptopIcon />, backgroundColor: '#465157' }
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
              backgroundColor: option.backgroundColor,
              color: '#fff'
            },
            textTransform: 'none'
          }}
        >
          {option.icon}{option.label}
        </ToggleButton>
      ))}
    </ToggleButtonGroup>
  );
}
