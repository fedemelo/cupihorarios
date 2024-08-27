import { Avatar, Box, Container, TextField, Typography } from "@mui/material";
import Banner from "../components/Banner";
import LockOutlinedIcon from "@mui/icons-material/LockOutlined";
import Footer from "../components/Footer";
import { useState } from "react";
import { Button } from "@mui/material";
import LoginIcon from "@mui/icons-material/Login";


export default function SignInPage() {
  const [email, setEmail] = useState('');

  const handleEmailChange = (event: { target: { value: React.SetStateAction<string>; }; }) => setEmail(event.target.value);
  const handleLogin = () => {
    localStorage.setItem('login', email);
    window.location.href = '/availability';
  };


  return (
    <>
      <Banner />
      <Container maxWidth="xs">
        <Box
          sx={{
            marginTop: 3,
            display: "flex",
            flexDirection: "column",
            alignItems: "center",
          }}
        >
          <Typography component="h1" variant="h4">
            CupiHorarios
          </Typography>
          <Avatar sx={{ m: 1, bgcolor: "secondary.main" }}>
            <LockOutlinedIcon />
          </Avatar>
          <Box sx={modalStyle}>
            <Typography id="login-modal-title" variant="h6" component="h2" gutterBottom>
              Registre su correo
            </Typography>
            <TextField
              fullWidth
              label="Correo"
              variant="outlined"
              value={email}
              onChange={handleEmailChange}
              sx={{ mb: 2 }}
            />
            <Box>
              <Button
                fullWidth
                variant="contained"
                disableElevation
                size="large"
                sx={{ mt: 3, mb: 2 }}
                startIcon={<LoginIcon />}
                onClick={handleLogin}
              >
                Ingresar
              </Button>
            </Box>
          </Box>
        </Box>
      </Container>
      <Footer />
    </>
  );
}


const modalStyle = {
  width: 300,
  bgcolor: 'background.paper',
  borderRadius: 2,
  p: 4,
};
