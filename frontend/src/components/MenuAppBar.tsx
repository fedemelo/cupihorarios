import * as React from "react";
import AppBar from "@mui/material/AppBar";
import Box from "@mui/material/Box";
import Toolbar from "@mui/material/Toolbar";
import IconButton from "@mui/material/IconButton";
import Typography from "@mui/material/Typography";
import Menu from "@mui/material/Menu";
import Container from "@mui/material/Container";
import Avatar from "@mui/material/Avatar";
import Tooltip from "@mui/material/Tooltip";
import MenuItem from "@mui/material/MenuItem";
import { AccountInfo, IPublicClientApplication } from "@azure/msal-browser";
import { useMsal } from "@azure/msal-react";
import { Link } from "react-router-dom"; // Asegúrate de tener react-router-dom instalado

interface MenuAppBarProps {
  user: AccountInfo;
  isAdmin: boolean;
  setAdminView?: React.Dispatch<React.SetStateAction<boolean>>;
}

function logout(instance: IPublicClientApplication) {
  instance.logoutRedirect().catch((e) => {
    console.error(e);
  });
}

export default function MenuAppBar({
  user,
  setAdminView,
  isAdmin,
}: MenuAppBarProps) {
  const settings = [{ tag: "Cerrar sesión", clickAction: handleLogout }];
  const { instance } = useMsal();

  function handleLogout() {
    logout(instance);
  }

  const [anchorElUser, setAnchorElUser] = React.useState<null | HTMLElement>(
    null
  );

  const handleOpenUserMenu = (event: React.MouseEvent<HTMLElement>) => {
    setAnchorElUser(event.currentTarget);
  };

  const handleCloseUserMenu = () => {
    setAnchorElUser(null);
  };

  return (
    <AppBar position="static">
      <Container maxWidth="xl">
        <Toolbar disableGutters>
          <Typography
            variant="h6"
            noWrap
            component={Link} // Usa el componente Link de react-router-dom
            to="/"
            sx={{
              mr: 2,
              display: { xs: "none", md: "flex" },
              textDecoration: "none",
              color: "inherit",
            }}
          >
            CupiHorarios
          </Typography>

          <Typography
            variant="h5"
            noWrap
            component={Link} // Usa el componente Link de react-router-dom
            to="/"
            sx={{
              mr: 2,
              display: { xs: "flex", md: "none" },
              flexGrow: 1,
              color: "inherit",
              textDecoration: "none",
            }}
          >
            CupiHorarios
          </Typography>

          <Box sx={{ flexGrow: 1, display: { xs: "none", md: "flex" } }}>
            <Box sx={{ display: 'flex', gap: '1rem' }}>
              <Typography component={Link} to="/schedule" sx={{ color: 'inherit', textDecoration: 'none' }}>
                Horario
              </Typography>
              <Typography component={Link} to="/" sx={{ color: 'inherit', textDecoration: 'none' }}>
                Disponibilidad
              </Typography>
            </Box>
          </Box>

          <Box sx={{ flexGrow: 0 }}>
            <Box
              sx={{
                display: "flex",
                direction: "row",
                alignItems: "center",
                gap: "10px",
              }}
            >
              <Typography>{user.name?.split(" ")[0] ?? ""}</Typography>
              <Tooltip title="Ajustes">
                <IconButton onClick={handleOpenUserMenu} sx={{ p: 0 }}>
                  <Avatar
                    alt={user.name}
                    sx={{
                      backgroundColor: "primary.main",
                    }}
                  />
                </IconButton>
              </Tooltip>
            </Box>
            <Menu
              sx={{ mt: "45px" }}
              id="menu-appbar"
              anchorEl={anchorElUser}
              anchorOrigin={{
                vertical: "top",
                horizontal: "right",
              }}
              keepMounted
              transformOrigin={{
                vertical: "top",
                horizontal: "right",
              }}
              open={Boolean(anchorElUser)}
              onClose={handleCloseUserMenu}
            >
              {settings.map((setting) => (
                <MenuItem
                  key={setting.tag}
                  onClick={() => setting.clickAction()}
                >
                  <Typography textAlign="center">{setting.tag}</Typography>
                </MenuItem>
              ))}
              {isAdmin && (
                <MenuItem
                  onClick={() => {
                    if (setAdminView) {
                      setAdminView((prev) => !prev);
                    }
                    handleCloseUserMenu();
                  }}
                >
                  <Typography textAlign="center">
                    Cambiar de rol administrador / tutor
                  </Typography>
                </MenuItem>
              )}
            </Menu>
          </Box>
        </Toolbar>
      </Container>
    </AppBar>
  );
}
