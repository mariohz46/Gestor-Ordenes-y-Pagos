const bcrypt =require("bcryptjs");
const usuarios = require("../models/usuariosModel");

const controller = {}

controller.insertar = async (req, res) => {
  const { nombre, contraseña } = req.body;

  try {
        // Hashear contraseña antes de guardar
        const hash = await bcrypt.hash(contraseña, 10);
        const nuevoUsuario = await usuarios.create({ nombre, contraseña: hash });
        res.json({ mensaje: 'Usuario registrado correctamente'});
    } catch (error) {
        res.status(500).json({ mensaje: 'Error en el servidor', error: error.message });
    }
}




module.exports =controller;