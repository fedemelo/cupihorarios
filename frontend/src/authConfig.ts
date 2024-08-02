const AZURE_CLIENT_ID = import.meta.env.VITE_AZURE_CLIENT_ID;
const AUTHORITY = "https://login.microsoftonline.com/organizations";
const REDIRECT_URI = import.meta.env.VITE_REDIRECT_URI;

export const msalConfig = {
  auth: {
    clientId: AZURE_CLIENT_ID,
    authority: AUTHORITY, // This is a URL (e.g. https://login.microsoftonline.com/{your tenant ID})
    redirectUri: REDIRECT_URI, //window.location.origin
  },
  cache: {
    cacheLocation: "sessionStorage", // This configures where your cache will be stored
    storeAuthStateInCookie: false, // Set this to "true" if you are having issues on IE11 or Edge
  },
};


// Add scopes here for ID token to be used at Microsoft identity platform endpoints.
export const loginRequest = {
  scopes: ["User.Read"],
};

export const IS_IN_PRODUCTION = import.meta.env.IS_IN_PRODUCTION
