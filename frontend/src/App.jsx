import React from 'react';
import { BrowserRouter as Router, Routes, Route, Navigate } from 'react-router-dom';
import AppRoutes from './AppRoutes.jsx';
import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap/dist/js/bootstrap.bundle.min.js';

function App() {
   return (
    <Router>
      <AppRoutes />
    </Router>
  );

 
}

export default App
