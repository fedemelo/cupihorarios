import React from "react";
import ReactDOM from "react-dom/client";
import App from "./App.js";
import { MsalProvider } from "@azure/msal-react";
import { PublicClientApplication } from "@azure/msal-browser";
import { msalConfig } from "./authConfig.js";
import { ThemeProvider } from "@emotion/react";
import { theme } from "./theme.js";
import { CssBaseline } from "@mui/material";
import { LocalizationProvider } from "@mui/x-date-pickers";
import { AdapterDayjs } from "@mui/x-date-pickers/AdapterDayjs";

const msalInstance = new PublicClientApplication(msalConfig);

ReactDOM.createRoot(document.getElementById("root") as HTMLElement).render(
  <React.StrictMode>
    <LocalizationProvider dateAdapter={AdapterDayjs}>
      <ThemeProvider theme={theme}>
        <CssBaseline>
          <MsalProvider instance={msalInstance}>
            <App />
          </MsalProvider>
        </CssBaseline>
      </ThemeProvider>
    </LocalizationProvider>
  </React.StrictMode>
);
