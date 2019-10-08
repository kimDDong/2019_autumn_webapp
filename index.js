var engine = require('consolidate');
var express = require('express');
var mysql = require('mysql');
var app = express();


app.use(express.static(__dirname + '/public'));
// html 파일 읽기위해 사용함
app.set('views', __dirname + '/views');
app.engine('html', engine.mustache);
app.set('view engine', 'html');
// 여기까지


app.get('/',function(req,res){
    if(req.query.id === undefined){
        res.render('main.html');    
    }
    else{
        res.render(req.query.id+'.html');
    }
});


var connection = mysql.createConnection({
	host: 'localhost',
	user: 'root',

	post: 3306,

	password: '1234',
	database: 'my_db'
});



app.listen(3000,function () {
    console.log('Server start, port : 3000');
});
