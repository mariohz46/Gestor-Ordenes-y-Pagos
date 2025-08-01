const {DataTypes}=require('sequelize');
const sequelize =require('../config/db');
const vehiculosModel =require('./vehiculosModel');
const clientesModel =require('./clientesModel');
const ciudadesModel =require('./ciudades.Model');
const usuariosModel =require('./usuariosModel');

const ordenes = sequelize.define('ordenes',{
    orden_id:{
        type:DataTypes.INTEGER,
        primaryKey:true,
        autoIncrement:true
    },
    status:{
        type:DataTypes.CHAR(3)
    },
    fechaCreacion:{
        type:DataTypes.DATE
    },
    fechaPickUp:{
        type:DataTypes.DATE
    },
    fechaDelivery:{
        type:DataTypes.DATE
    },
    fechaAsignacion:{
        type:DataTypes.DATE
    },
    direccionPickUp:
    {
        type:DataTypes.CHAR(200)
    },
    direccionDelivery:
    {
        type:DataTypes.CHAR(200)
    },
    totalTarifa:
    {
        type:DataTypes.DECIMAL(10,2)
    },
    totalPagoDriver:
    {
        type:DataTypes.DECIMAL(10,2)
    },
    totalBrokerFee:
    {
        type:DataTypes.DECIMAL(10,2)
    },
    millas:
    {
        type:DataTypes.INTEGER
    },
    pagadoEn:
    {
        type:DataTypes.CHAR(60)
    },

    vehiculo_id:{
    type:DataTypes.INTEGER,
    allowNull: false,
        references:{
            model: vehiculosModel,
            key: 'vehiculo_id'
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
    ciudades_id:{
        type:DataTypes.INTEGER,
        allowNull: false,
            references:{
                model: ciudadesModel,
                key: 'ciudad_id'
            }
    },
    usuario_id:{
        type:DataTypes.INTEGER,
        allowNull: false,
            references:{
                model: usuariosModel,
                key: 'usuario_id'
            }
    },
    tableName:'ordenes',
    timestamps:false
    
});
ordenes.belongsTo(vehiculosModel,{foreingKey:'vehiculo_id'});
ordenes.belongsTo(clientesModel,{foreingKey:'cliente_id'});
ordenes.belongsTo(ciudadesModel,{foreingKey:'ciudad_id'});
ordenes.belongsTo(usuariosModel,{foreingKey:'usuario_id'});

module.exports =ordenes;