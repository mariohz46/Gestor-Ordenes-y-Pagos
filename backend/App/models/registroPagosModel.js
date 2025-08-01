const {DataTypes}=require('sequelize');
const sequelize =require('../config/db');
const ordenesModel =require('./ordenesModel');
const clientesModel=require('./clientesModel');
const driversModel=require('./driversModel');

const registroPagos =sequelize.define('registropago',{
    pago_id:{
        type:DataTypes.INTEGER,
        primaryKey:true,
        autoIncrement:true
    },
    fechaDeRecibido:{
        type:DataTypes.DATE
    },
    monto:{
        type:DataTypes.DECIMAL(10,2)
    },
    metodoDePago:{
        type:DataTypes.CHAR(25)
    },
    orden_id:{
    type:DataTypes.INTEGER,
    allowNull: false,
        references:{
            model: ordenesModel,
            key: 'orden_id'
        }
    },
    cliente_id:{
        type:DataTypes.INTEGER,
        allowNull: false,
            references:{
                model: clientesModel,
                key: 'cliente_id'
            }
    },
    driver_id:{
        type:DataTypes.INTEGER,
        allowNull: false,
            references:{
                model: driversModel,
                key: 'driver_id'
            }
    },
    tableName:'registropago',
    timestamps:false
    
});
registroPagos.belongsTo(ordenesModel,{foreingKey:'orden_id'});
registroPagos.belongsTo(clientesModel,{foreingKey:'cliente_id'});
registroPagos.belongsTo(driversModel,{foreingKey:'driver_id'});


module.exports=registroPagos;