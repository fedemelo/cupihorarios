import { useState } from 'react';
import Button from '@mui/material/Button';
import TextField from '@mui/material/TextField';
import Dialog from '@mui/material/Dialog';
import DialogActions from '@mui/material/DialogActions';
import DialogContent from '@mui/material/DialogContent';
import DialogContentText from '@mui/material/DialogContentText';
import DialogTitle from '@mui/material/DialogTitle';
import { createNewSchedule } from '../../requests/postUtils';

interface GenerateNewScheduleProps {
  updateExistingSchedules?: () => void;
}

export default function GenerateNewSchedule({ updateExistingSchedules }: GenerateNewScheduleProps) {
  const [open, setOpen] = useState(false);
  const [scheduleName, setScheduleName] = useState('');

  const handleClickOpen = () => {
    setOpen(true);
  };

  const handleClose = () => {
    setOpen(false);
    setScheduleName('');
  };

  const handleCreate = async () => {
    try {
      const newSchedule = await createNewSchedule(scheduleName);
      if (updateExistingSchedules) {
        updateExistingSchedules();
      }
      console.log('Nuevo horario creado:', newSchedule.id);
      handleClose();
    } catch (error) {
      console.error('Error al crear el horario:', error);
    }
  };

  return (
    <>
      <Button variant="contained" color="primary" onClick={handleClickOpen} sx={{ textTransform: 'none' }}>
        Generar Nuevo Horario
      </Button>
      <Dialog open={open} onClose={handleClose}>
        <DialogTitle>Crear Nuevo Horario</DialogTitle>
        <DialogContent>
          <DialogContentText>
            Por favor, ingresa el nombre del nuevo horario.
          </DialogContentText>
          <TextField
            autoFocus
            margin="dense"
            label="Nombre del Horario"
            type="text"
            fullWidth
            value={scheduleName}
            onChange={(e) => setScheduleName(e.target.value)}
          />
        </DialogContent>
        <DialogActions>
          <Button onClick={handleClose} color="primary">
            Cancelar
          </Button>
          <Button onClick={handleCreate} color="primary">
            Crear
          </Button>
        </DialogActions>
      </Dialog>
    </>
  );
}
