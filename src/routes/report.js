const express = require('express');
const report = express.Router();
const data = require('../database/data.js');
const { jsPDF } = require('jspdf');
const fs = require('node:fs');
report.get('/generar', (req, res) => {
  const query = `
  SELECT
    SUM(CASE WHEN prestamo = 0 THEN 1 ELSE 0 END) AS prestamos,
    SUM(CASE WHEN reserva = 0 THEN 1 ELSE 0 END) AS reservas,
    SUM(CASE WHEN prestamo = 1 AND reserva = 1 THEN 1 ELSE 0 END) AS disponibles
FROM biblioteca;
  `;
  data.query(query, (err, result) => {
    if(err){
      console.error("Error al ejecutar consulta", error);
      res.status(500).send("Error al ejecutar");
      return;
    }
    const doc = new jsPDF();
   // doc.setFont("heletica", "normal");
    doc.setFontSize(12);

    let y = 20;
    const lineHeight = 10;

    doc.text("Reporte de estado de libros:", 20, y);
    y += lineHeight*2;
    
    const data = result[0];

    doc.text(`Total libros en prestamos: ${data.prestamos}`, 20, y);
    y += lineHeight;


    doc.text(`Total libros en reserva: ${data.reservas}`, 20, y);
    y += lineHeight;

    doc.text(`Total libros diponibles: ${data.disponibles}`, 20, y);
    const pdfOutput = doc.output();

    res.setHeader('Content-Type', 'application/pdf');
    res.setHeader('Content-Disposition', 'inline; filename="estadisticas.pdf"');
    res.send(Buffer.from(pdfOutput, 'latin1'));

    //res.redirect('/recurso');
  })
})

module.exports = report;
