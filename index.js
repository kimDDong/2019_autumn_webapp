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

// app.get('/',function(req,res){
//     res.render(req.query.id+'.html');
// }); 나중에 정리하기 !

app.get('/',function(req,res){
    res.render('main.html');
});

app.get('/notice',function(req,res){
    res.render('notice.html');
});

app.get('/courses',function(req,res){
    res.render('courses.html');
});

app.get('/contact',function(req,res){
    res.render('contact.html');
});

app.get('/gallery',function(req,res){
    res.render('gallery.html');
});

app.get('/login',function(req,res){
    res.render('login.html');
});

app.get('/members',function(req,res){
    res.render('members.html');
});

app.get('/publications',function(req,res){
    res.render('publications.html');
});

app.get('/research',function(req,res){
    res.render('research.html');
});

var connection = mysql.createConnection({
	host: 'localhost',
	user: 'root',

	post: 3306,

	password: 'oracle11',
	database: 'my_db'
});



app.listen(3000,function () {
    console.log('Server start, port : 3000');
});
