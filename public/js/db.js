var mysql = require('mysql');

var connection = mysql.createConnection({
	host: 'localhost',
	user: 'root',
	post: 3306,
	password: 'root',
	database: '1234'
});

module.exports = connection;
