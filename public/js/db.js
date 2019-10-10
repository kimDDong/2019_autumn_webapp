var mysql = require('mysql');

var connection = mysql.createConnection({
	host: 'localhost',
	user: 'root',
	post: 3306,
	password: 'oracle11',
	database: 'my_db'
});

module.exports = connection;
