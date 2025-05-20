const express = require('express');
const routes = express.Router();
const data = require('../database/data.js');
const session = require('express-session');

 //login
  //Ingreso de user
routes.get('/' , (req, res) => {
    res.render('login');
})

routes.use(session({
  secret: 's3cr3t0',
  resave: true,
  saveUninitialized: true
}));
//creando session de ingreso
//Login de usuarios
routes.post('/login', (req, res) => {
        const usuario = req.body.usuario;
        const password = req.body.password;
        if(usuario && password) {
                data.query('SELECT * FROM usuarios WHERE usuario = ? AND password = ?', [usuario, password], (err, results)=> {
                        if(results[0] === undefined) {
                                res.redirect('/');
                        }else{
                                req.session.loggein = true;
                                req.session.usuario = usuario;
                                req.session.role = results[0].rol;
                                res.redirect('/nav');

                        }
                })
        }else {
                res.redirect('/');
        }
})
//Autorizacion de roles;
function auth(req, res, next) {
        if(req.session.loggein) {
                next();
        }else {
                res.send('Por favor inicie sesion para ver esta pagina');
                res.redirect('/');
        }
}
//Pagina de prueba
routes.get('/prueba' , auth, (req, res) => {
        if(req.session.role == 'administrador') {
                res.send('Ingreso admmin');
        }else {
                res.send('No tiene acceso');
        }                      
}); 
 
//pagina de navegacion
routes.get('/nav', (req, res) => {
  res.render('navegacion');
})

//listado de los recursos que hay
routes.get('/lista', (req, res) => {
  data.query("SELECT * FROM biblioteca", (err, result) => {
    if(err)
      res.status(500)("no se encontraron datos");
    //Aqui renderizamos la plantilla y los datos de la consulta
    res.render('libros', {dataEnviada:result});
    })
});
//muestra ell detalle del libro
routes.get('/libro/:id' , (req,res) => {
  const id = req.params.id;
  data.query("SELECT * FROM biblioteca WHERE id = ?", [id], (err, result) => {
    if(err){
      res.status(500)("No se encontro");
    }
    res.render('detallelibro', {libro:result});
    //res.send(result);
  });
});
//form gestiona un prestamo
routes.get('/prestamo/:id', (req, res) => {
  const id = req.params.id;
  data.query("SELECT * FROM biblioteca WHERE id = ?", [id], (err, result) =>{
    if(err){
      res.status(500)("no se encontro");
    }
    res.render('prestamo', {libros:result});
  })
});
//form para gestionar la reserva de un recurso
routes.get('/reserva/:id', (req, res)=> {
  const id = req.params.id;
  data.query("SELECT * FROM biblioteca WHERE id = ?", [id], (err, result) =>{
    if(err){
      res.status(500)("no se encontro");
    }
    res.render('reserva', {libros:result});
  })
});
const crud = require('../controllers/crud.js');
routes.post('/gprestamo', crud.gprestamo);
routes.post('/greserva', crud.greserva);
//vista de los usuarios existentes
routes.get('/usuario', auth, (req,res) => {
  if(req.session.role == "administrador") {
    data.query("SELECT * FROM usuarios", (err, result) => {
      if(err)
        res.status(500)("No se encuentara");
      res.render('gestionusuario', {usuarios:result});
    });
  }else {
    res.redirect('/nav');
  }
});
//edicion del usuario escogido
routes.get('/editusuario/:id', (req, res) => {
  const id = req.params.id;
  data.query("SELECT * FROM usuarios WHERE id_usuario=?", [id], (err,result) => {
    if(err)
      res.status(500)("No se encontro usuario");
    res.render('editusuario', {usuarios:result});
  });
});
//llamando la funcion para actualizar usuario
routes.post('/actusuario', crud.actusuario);
//gestion de los recursos
routes.get('/recurso', auth, (req, res) => {
  if(req.session.role=="administrador"){
    data.query("SELECT * FROM biblioteca", (err, result) => {
      if(err)
        res.status(500)("no se encontraron datos");
      res.render('gestionrecurso', {dataEnviada:result});
    })
  }else {
    res.redirect('/nav');
  }
});
//enviando recurso para editar
routes.get('/editrecurso/:id', (req, res) => {
  const id =req.params.id;
  data.query("SELECT * FROM biblioteca WHERE id = ? ", [id], (err, result) =>{
    if(err)
      res.status(500)("No se encontro libro")
    res.render('editrecurso', {dataEnviada:result})
  })
})
//llamando funcion para actualizar recurso
routes.post('/acturecurso', crud.acturecurso);
//creacion de usuario
routes.get('/crearusuario', (req, res) => {
  res.render('crearusuario');
});
//llamado para crear usuario
routes.post('/crearcliente', crud.crearusuario);
//eliminar usuario
routes.get('/eliminarusuario/:id', (req, res) => {
  const id =req.params.id;
  data.query("DELETE FROM usuarios WHERE id_usuario = ?", [id], (err, result) => {
    if(err)
      console.log("No se elimino usuario");
    res.redirect('/usuario');
  })
})
//crear recurso
routes.get('/crearrecurso', (req,res) => {
  res.render('crearrecurso');
})
//eliminar recurso
routes.get('/eliminarecurso/:id', (req, res) => {
  const id = req.params.id;
  data.query("DELETE FROM biblioteca where id = ?", [id], (err, result)=> {
    if(err)
      console.log("no eliimino recurso")
    res.redirect('/recurso'); 
  })
})
//llamado para crear recurso
routes.post('/crearrecurso', crud.crearrecurso);
//llamando panel admin
routes.get('/panel', (req,res) => {
  data.query("SELECT * FROM reglas", (err, result) => {
    if(err)
      res.status(500)("no se encontro");
    res.render('reglas', {dataEnviada:result});
  })
})
//llamado de para actualizar reglas
routes.post('/actreglas', crud.actreglas)




module.exports = routes;
