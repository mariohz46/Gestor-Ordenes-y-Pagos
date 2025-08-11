const usuarios = require("../models/usuariosModel");
const bcrypt =require("bcryptjs");
const jwt=require("jsonwebtoken");

const controller = {}
const secret_key="clave";

controller.login = async (req,res) =>{
    const { nombre, contraseña} = req.body;
    try {
        const usuario= await usuarios.findOne({where:{nombre}});
        if(nombre ==""){
            return res.status(401).json({mensaje:"Ingrese un usuario por favor"});
        }
        
        if(contraseña ==""){
            return res.status(401).json({mensaje:"inserte una contraseña"});
        }
        
        if(!usuario){
            return res.status(401).json({mensaje:"usuario incorrecto!"});
        }

        const contraseñaValida = await bcrypt.compare(contraseña,usuario.contraseña);
        if(!contraseñaValida){
             return res.status(401).json({mensaje:"contraseña incorrecta!"});
        }

        const token=jwt.sign(
            {usuario_id:usuario.usuario_id, nombre: usuario.nombre},
            secret_key,
            {expiresIn:"7h"}
        );

        return res.json({
            success:true,
            mensaje: "Login exitoso",
            token,
            usuario: {
                usuario_id: usuario.usuario_id,
                nombre: usuario.nombre
            }
        });
        console.log("este es el token de la sesion",token);
    } catch (error) {
        return res.status(500).json({ mensaje: "Error en el servidor", error: error.message });
    }
}


module.exports =controller;
