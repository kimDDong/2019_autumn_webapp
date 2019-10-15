var mysql = require('mysql');


var db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    post: 3306,

    password: 'oracle11',

    database: 'se_lab'
});

db.connect();

module.exports = db;