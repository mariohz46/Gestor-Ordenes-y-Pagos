const {DataTypes}=require('sequelize');
const sequelize =require('../config/db');

const ciudades = sequelize.define('ciudades',{
    ciudad_id:{
        type:DataTypes.INTEGER,
        primaryKey:true,
        autoIncrement:true
    },
    nombre:{
        type:DataTypes.CHAR(30)
    },
    zipCode:{
        type:DataTypes.CHAR(10)
    },
    estado:{
        type:DataTypes.CHAR(30)
    }
    ,
    tableName:'ciudades',
    timestamps:false
    
});

module.exports =ciudades;