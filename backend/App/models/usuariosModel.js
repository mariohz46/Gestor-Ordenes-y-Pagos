const {DataTypes,Sequelize}=require('sequelize');
const { sequelizeInstance } = require('../config/db');

const usuarios = sequelizeInstance.define('usuarios',{
    usuario_id:{
        type:DataTypes.INTEGER,
        primaryKey:true,
        autoIncrement:true
    },
    nombre:{
        type:DataTypes.CHAR(50)
    },
    contraseña:{
        type:DataTypes.CHAR(70)
    }
    
    
},{
tableName:'usuarios',
timestamps: false

});



module.exports=usuarios;