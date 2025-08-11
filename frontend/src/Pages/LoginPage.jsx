import "bootstrap/dist/css/bootstrap.min.css";
import "../Styles/LoginPage.css";
import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import axios from 'axios';

function LoginPage() {
  const [nombre, setUsername] = useState('');
  const [contraseña, setPassword] = useState('');
  const [error, setError] = useState({ type: '', message: '' });
  const navigate = useNavigate();

  const handleSubmit = async (e) => {
    e.preventDefault();
    setError({ type: '', message: '' });
    try {
      const response = await axios.post('http://localhost:3000/login', { 
        nombre, 
        contraseña 
      });
      
      if(response.data.success){
        localStorage.setItem('token', response.data.token);
        console.log(response);
        navigate('/main');
      }else{
        setError(response.data.mensaje || 'Error desconocido');
      }
      /*if (response.status === 200) {
        navigate('/main');
        localStorage.setItem('token', response.data.token);
      }*/
      
    } catch (error) {
      if (error.response) {
        const { errorType, mensaje } = error.response.data;
        setError({
          type: errorType || 'general',
          message: mensaje || 'Error desconocido'
        });
      }
    }
  }
    
  return (
    <form className="mx-auto" onSubmit={handleSubmit}>
        <h4 className="text-center">Login</h4>
      <div class="mb-3 mt-5">
        <label for="usuario" className="form-label">Usuario</label>
        <input type="text" className="form-control" id="usuario" aria-describedby="usuario" value={nombre} onChange={(e) => setUsername(e.target.value)}/>
      </div>

      <div className="mb-3">
        <label for="contraseña" className="form-label">Password</label>
        <input type="password" className="form-control" id="contraseña" value={contraseña} onChange={(e) => setPassword(e.target.value)}/>
        <div id="emailHelp" className="form-text">Olvidaste tu contraseña?</div>
      </div>

      <button type="submit" className="btn btn-primary mt-4">Iniciar sesion</button>

      {error.message && (
        <div className={`alert ${error.type === 'username' ? 'alert-warning' : 
                         error.type === 'password' ? 'alert-danger' : 
                         'alert-secondary'}`}>
          {error.message}
        </div>
      )}
    </form>
  );
}

export default LoginPage;
