import { Copyright } from "../../components/Copyright";
import { Box, CircularProgress } from "@mui/material";
import MenuAppBar from "../../components/MenuAppBar";
import { useMsal } from "@azure/msal-react";
import { useEffect, useState } from "react";
import UnauthorizedView from "../../components/UnauthorizedView";
import AvailabilitySelector from "../../components/AvailabilitySelector";
import { fetchIsAuthorized } from "../../requests/fetchUtils";

export default function MainPage() {
  const { accounts } = useMsal();
  const assistantLogin = accounts[0].username.split("@")[0];
  const user = accounts[0];

  const [isAuthorized, setIsAuthorized] = useState(false);
  const [loading, setLoading] = useState(true);
  const [isAdmin, setIsAdmin] = useState(false);
  const [assistantCode, setAssistantCode] = useState(0);
  const [adminView, setAdminView] = useState(false);

  useEffect(() => {
    fetchIsAuthorized(assistantLogin, setIsAuthorized, setAssistantCode, setIsAdmin, setLoading);
  }, [assistantLogin]);


  if (loading) {
    return (
      <>
        <MenuAppBar user={user} isAdmin={isAdmin} />
        <Box
          display={"flex"}
          width={"100vw"}
          height={"90vh"}
          justifyContent={"center"}
          alignItems={"center"}
        >
          <CircularProgress />
        </Box>
      </>
    );
  }

  if (!isAuthorized) {
    return (
      <>
        <MenuAppBar user={user} isAdmin={isAdmin} />
        <Box display={"flex"}>
          <UnauthorizedView />
        </Box>
      </>
    );
  }

  return (
    <>
      <MenuAppBar user={user} isAdmin={isAdmin} setAdminView={setAdminView} />
      <Box>
        <AvailabilitySelector assistantCode={assistantCode} isAdmin={isAdmin} adminView={adminView} />
      </Box>
      <Copyright />
    </>
  );
}
