//Servidor de express
const express =require('express');
const App=express();
const cors=require("cors");

App.use(express.json());
App.use(express.urlencoded({extended: false}));
App.use(cors());
App.use(require('../App/routes/usuariosRoute'));
App.use(require('../App/routes/loginRoute'));



module.exports=App;
