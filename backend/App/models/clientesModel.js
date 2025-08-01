const {DataTypes}=require('sequelize');
const sequelize =require('../config/db');

const clientes = sequelize.define('clientes',{
    cliente_id:{
        type:DataTypes.INTEGER,
        primaryKey:true,
        autoIncrement:true
    },
    nombre:{
        type:DataTypes.CHAR(30)
    },
    segundoNombre:{
        type:DataTypes.CHAR(30)
    },
    apellido:{
        type:DataTypes.CHAR(30)
    },
    correo:{
        type:DataTypes.CHAR(100)
    },
    numeroTelefono:{
        type:DataTypes.CHAR(15)
    },
    tableName:'clientes',
    timestamps:false
    
});

module.exports =clientes;