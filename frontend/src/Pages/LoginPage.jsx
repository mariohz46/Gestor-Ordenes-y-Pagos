import "bootstrap/dist/css/bootstrap.min.css";
import "../Styles/LoginPage.css";
import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import axios from 'axios';

function LoginPage(props) {
  const [nombre, setUsername] = useState('');
  const [contraseña, setPassword] = useState('');
  const [errorMessage, setErrorMessage] = useState('');
  const navigate = useNavigate();

    const handleSubmit = async (e) => {
        e.preventDefault();

        if(!nombre || !contraseña){
          setErrorMessage('Por favor ingresa la informacion necesaria para iniciar sesion.');
          return
        }
        try {
          
            setErrorMessage('');
            const response = await axios.post('http://localhost:3000/login', { nombre, contraseña });
            if (response.status === 200) {
                navigate('/main');
            }
        } catch (error) {
          console.error('Error:', error);
            setErrorMessage('Your Username or\nPassword are incorrect.');
        }       
    };

  return (
    <form className="mx-auto" onSubmit={handleSubmit}>
        <h4 className="text-center">Login</h4>
      <div class="mb-3 mt-5">
        <label for="usuario" class="form-label">Usuario</label>
        <input type="text" class="form-control" id="usuario" aria-describedby="usuario" value={nombre} onChange={(e) => setUsername(e.target.value)}/>
      </div>

      <div class="mb-3">
        <label for="contraseña" class="form-label">Password</label>
        <input type="password" class="form-control" id="contraseña" value={contraseña} onChange={(e) => setPassword(e.target.value)}/>
        <div id="emailHelp" class="form-text">Olvidaste tu contraseña?</div>
      </div>

      <button type="submit" class="btn btn-primary mt-4">Iniciar sesion</button>
      {errorMessage && <p className="text-red-500 text-sm whitespace-pre-line text-center mt-4 ">{errorMessage}</p>} {/* Display error message if exists */}
    </form>
  );
}

export default LoginPage;
