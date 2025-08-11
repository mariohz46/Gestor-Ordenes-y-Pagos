import { Routes, Route, Router } from "react-router-dom";
import ProtectedRoute from "./ProtectedRoutes";
import MainPage from "./Pages/MainPage.jsx";
import LoginPage from "./Pages/LoginPage.jsx";

//import Layout from './Layout'; // Un layout común para tus páginas privadas
function AppRoutes() {
     return (
       <Routes>
         <Route path="/login" element={<LoginPage />} />
         <Route 
           element={<ProtectedRoute />}
         >
           <Route path="/main" element={<MainPage/>} />
         </Route>
       </Routes>
     );
   }
   export default AppRoutes;
