import { Navigate } from 'react-router-dom';

// Puedes adaptar la lógica de "isAuthenticated" según cómo manejes la sesión.
function ProtectedRoute({ children }) {
  const token = localStorage.getItem('token'); // O donde guardes tu token

  if (!token) {
    // Si no hay token, redirige al login
    return <Navigate to="/login" replace />;
  }

  // Si hay token, permite el acceso al contenido protegido
  return children;
}

export default ProtectedRoute;