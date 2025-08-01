const {DataTypes}=require('sequelize');
const sequelize =require('../config/db');
const tiposDeTransporteModel=require('./tiposDeTransporteModel');

const vehiculos = sequelize.define('vehiculos',{
    vehiculo_id:{
        type:DataTypes.INTEGER,
        primaryKey:true,
        autoIncrement:true
    },
    marca:{
        type:DataTypes.CHAR(60)
    },
    modelo:{
        type:DataTypes.CHAR(60)
    },
    año:{
        type:DataTypes.INTEGER
    },
    color:{
        type:DataTypes.CHAR(30)
    },
    esOperable:{
        type:DataTypes.CHAR(3)
    },
    nota:{
        type:DataTypes.CHAR(300)
    },
    peso:{
        type:DataTypes.DOUBLE
    },
    ancho:{
        type:DataTypes.DOUBLE
    },
    alto:{
        type:DataTypes.DOUBLE
    },
    tipoDeTransporte_id:{
    type:DataTypes.INTEGER,
    allowNull: false,
        references:{
            model: tiposDeTransporteModel,
            key: 'tipoDeTransporte_id'
        }
},
    tableName:'vehiculos',
    timestamps:false
    
});
vehiculos.belongsTo(tiposDeTransporteModel,{foreingKey:'tipoDeTransporte_id'});

module.exports =vehiculos;