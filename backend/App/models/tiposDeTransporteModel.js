const {DataTypes}=require('sequelize');
const sequelize =require('../config/db');

const tiposDeTransporte =sequelize.define('tipodetransporte',{
    tipoDeTransporte_id:{
        type:DataTypes.INTEGER,
        primaryKey:true,
        autoIncrement:true
    },
    nombre:{
        type:DataTypes.CHAR(50)
    },
    tableName:'tipodetransporte',
    timestamps:false
    
});



module.exports=tiposDeTransporte;