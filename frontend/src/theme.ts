import { createTheme } from "@mui/material/styles";


// Define your color palette
export const theme = createTheme({
  palette: {
    primary: {
      main: '#3B41C9',  // Color principal
    },
    secondary: {
      main: '#FFA123',  // Color secundario
    },
    text: {
      primary: '#465157',  // Color para el texto principal
    },
    background: {
      default: '#F8F7FF',  // Color de fondo
      paper: '#B8B8FF',    // Color de fondo para elementos de papel (cards, dialogs, etc.)
    },
  },
});


