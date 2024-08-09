import { BrowserRouter as Router, Routes, Route, useNavigate } from "react-router-dom";
import AvailabilityPage from "./pages/availability/AvailabilityPage";
import SchedulePage from "./pages/schedule/SchedulePage";
import Docs from "./pages/Docs";
import SignInPage from "./pages/SignInPage";

function App() {
  return <Router>
  <Routes>
    <Route path="/" element={<SignInPage />} />
    <Route path="/availability" element={<AvailabilityPage />} />
    <Route path="/schedule" element={<SchedulePage />} />
    <Route path="/docs" element={<Docs />} />
  </Routes>
</Router>
}

export default App;
