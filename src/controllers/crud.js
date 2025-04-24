const database = require('../database/data');
exports.gprestamo = (req, res) => {
  const id = req.body.id;
  const prestamo = req.body.prestamo;
  console.log(id);

  database.query("UPDATE biblioteca set prestamo = ? where id=?", [prestamo, id], (err, result) => {
    if(err){
      console("no se actualizo");
    }
    res.redirect('/lista');
  })

}
exports.greserva = (req, res) => {
  const id = req.body.id;
  const reserva = req.body.reserva;
  console.log(id);

  database.query("UPDATE biblioteca set reserva = ? where id=?", [reserva, id], (err, result) => {
    if(err){
      console("no se actualizo");
    }
    res.redirect('/lista');
  })

}
exports.actusuario = (req, res) => {
  const id = req.body.id;
  const usuario = req.body.user;
  const rol = req.body.rol;
  const password = req.body.password;

  database.query("UPDATE usuarios SET ? WHERE id_usuario = ?", [{usuario:usuario, password:password, rol:rol}, id], (err, result) => {
    if(err)
      console.log("no actualiza");
    res.redirect('/usuario');
  })
}
exports.acturecurso = (req, res) => {
  const id = req.body.id;
  const titulo = req.body.titulo;
  const autor =  req.body.autor;
  const descripcion = req.body.descripcion;
  const reserva = req.body.reserva;
  const prestamo = req.body.prestamo;

  database.query("UPDATE biblioteca SET ? WHERE id = ?", [{titulo:titulo, autor:autor, descripcion:descripcion, reserva:reserva, prestamo:prestamo}, id], (err, result) => {
    if(err)
      console.log("no se actualizo")
    res.redirect('/recurso');
  })
}
exports.crearusuario = (req, res) => {
  const usuario = req.body.usuario;
  const password =req.body.password;
  const rol = req.body.rol;

  database.query("INSERT INTO usuarios SET ?", [{usuario:usuario, password:password, rol:rol}], (err, result) => {
    if(err)
      console.log("No creo usuario");
    res.redirect('/usuario');
  })
}
exports.crearrecurso = (req, res) => {
  const titulo = req.body.titulo;
  const autor = req.body.autor;
  const isbn = req.body.isbn;
  const descripcion = req.body.descripcion;
  const reserva = true;
  const prestamo = true;
  database.query("INSERT INTO biblioteca SET ?",[{titulo:titulo, autor:autor, isbn:isbn, descripcion:descripcion, reserva:reserva, prestamo:prestamo}], (err, result) => {
    if(err)
      console.log("No ingreso recurso");
    res.redirect('/recurso');
  })
}
exports.actreglas = (req, res) => {
  const id = req.body.id;
  const dias = req.body.dias;
  const multa = req.body.multa;

  database.query("UPDATE reglas SET ? WHERE id_regla = ?",[{dias:dias, multa:multa}, id], (err, result)=> {
    if(err)
      console.log("no se pudo actualizar las reglas");
    res.redirect('/panel');
  })
}
