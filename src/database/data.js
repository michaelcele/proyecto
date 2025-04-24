const mysql = require('mysql2');
const data = require('../config/config.json');

const dbConfig = data.database;
const conecction = mysql.createConnection(dbConfig);

conecction.connect((err) => {
        if(err){
                console.error(err);
                return;
        }
})

module.exports = conecction;

