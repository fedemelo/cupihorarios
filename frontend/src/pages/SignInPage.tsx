import { Avatar, Box, Container, Typography } from "@mui/material";
import Banner from "../components/Banner";
import { SignInButton } from "../components/SignInButton";
import LockOutlinedIcon from "@mui/icons-material/LockOutlined";
import Footer from "../components/Footer";

export default function SignInPage() {
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
          <Typography component="h2" variant="h5">
            Inicia sesión
          </Typography>
          <Box>
            <SignInButton />
          </Box>
        </Box>
      </Container>
      <Footer />
    </>
  );
}
