import { router } from "./router/router";
import { RouterProvider } from "react-router-dom";
import SignInPage from "./router/pages/SignInPage";
import {
  AuthenticatedTemplate,
  UnauthenticatedTemplate,
} from "@azure/msal-react";

function App() {
  return (
    <>
      <AuthenticatedTemplate>
        <RouterProvider router={router} />
      </AuthenticatedTemplate>
      <UnauthenticatedTemplate>
        <SignInPage />
      </UnauthenticatedTemplate>
    </>
  );
}

export default App;
