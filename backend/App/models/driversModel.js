const {DataTypes}=require('sequelize');
const sequelize =require('../config/db');

const drivers =sequelize.define('drivers',{
    driver_id:{
        type:DataTypes.INTEGER,
        primaryKey:true,
        autoIncrement:true
    },
    nombre:{
        type:DataTypes.CHAR(50)
    },
    nombreEmpresa:{
        type:DataTypes.CHAR(30)
    },
    tableName:'drivers',
    timestamps:false
});



module.exports=drivers;