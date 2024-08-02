import { Copyright } from "../../components/Copyright";
import { Box } from "@mui/material";
import MenuAppBar from "../../components/MenuAppBar";
import { useMsal } from "@azure/msal-react";
import { useEffect, useState } from "react";
import AvailabilitySelector from "../../components/AvailabilitySelector";
import { fetchIsAuthorized } from "../../requests/fetchUtils";
import LoadingScreen from "../../components/LoadingScreen";
import UnauthorizedScreen from "../../components/UnauthorizedScreen";

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
    return <LoadingScreen user={user} isAdmin={isAdmin} />;
  }

  if (!isAuthorized) {
    return <UnauthorizedScreen user={user} isAdmin={isAdmin} />;
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
