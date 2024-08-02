import { useMsal } from "@azure/msal-react";
import { loginRequest } from "../authConfig";
import { Button } from "@mui/material";
import LoginIcon from "@mui/icons-material/Login";
import { IPublicClientApplication } from "@azure/msal-browser";

function handleLogin(instance: IPublicClientApplication) {
  instance.loginRedirect(loginRequest).catch((e) => {
    console.error(e);
  });
}

/**
 * Renders a button which, when selected, will redirect the page to the login prompt
 */
export const SignInButton = () => {
  const { instance } = useMsal();

  return (
    <Button
      fullWidth
      variant="contained"
      disableElevation
      size="large"
      sx={{ mt: 3, mb: 2 }}
      startIcon={<LoginIcon />}
      onClick={() => handleLogin(instance)}
    >
      Ingresar con Uniandes
    </Button>
  );
};
