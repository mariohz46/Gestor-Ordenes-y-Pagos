const express =require('express');
const router = express.Router();
const usuariosController =require('../controllers/usuariosController');



router.post('/usuarios',usuariosController.insertar);
/*
router.get('/ingresos',controllerIngreso.mostrarIngresos);
router.put('/ingresos',controllerIngreso.actualizar);
router.delete('/ingresos',controllerIngreso.eliminar);*/


module.exports = router;