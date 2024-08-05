import { deleteAllAssistantAvailabilities } from "../../requests/deleteUtils";
import { Button, Stack } from "@mui/material";

interface ToggleButtonGroupSlotProps {
  assistantCode: number;
}

export default function CleanAvailabilityButton({ assistantCode }: ToggleButtonGroupSlotProps) {
  const handleCleanAvailability = async () => {
    if (window.confirm('¿Estás seguro de que quieres eliminar toda tu disponibilidad?')) {
      try {
        await deleteAllAssistantAvailabilities(assistantCode);
        alert('Se ha eliminado toda tu disponibilidad');
        window.location.reload();
      } catch (error: any) {
        alert('Error al eliminar tu disponibilidad');
      }
    }
  };

  return (
    <Stack alignItems={'center'} marginTop={4} >
    <Button variant="contained" color="secondary" onClick={handleCleanAvailability} sx={{ textTransform: 'none' }}>
      Limpiar disponibilidad
    </Button>
    </Stack>
  );
}
