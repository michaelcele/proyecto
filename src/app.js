const express = require("express")
const app = express();//framework que se utiliza para montar el servidor
const puerto = 4000;          
const path = require('path');
const {json} = require('express');  //metodo utilizado para la informacion JSON

app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'views'));//ruta de los archivos de vistas
app.use(express.static(path.join(__dirname, '..', 'public')));
app.use(express.urlencoded({extended:false}));
//app.use(json);
const routes = require('./routes/routes');
app.use('/', routes);
app.listen(puerto);
