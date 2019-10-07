var engine = require('consolidate');
var express = require('express');
var app = express();

app.use(express.static(__dirname + '/public'));
// html 파일 읽기위해 사용함
app.set('views', __dirname + '/views');
app.engine('html', engine.mustache);
app.set('view engine', 'html');
// 여기까지

app.get('/',function(req,res){
    res.render('main.html');
});




app.listen(3000,function () {
    console.log('Server start, port : 3000');
});
