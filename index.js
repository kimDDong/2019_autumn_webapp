var engine = require('consolidate');
var express = require('express');
var mysql = require('mysql');
var http = require('http');
var fs = require('fs');
var url = require('url');
var db = require('./public/js/db.js');

var app = express();
var template = require('./public/js/template.js');

app.use(express.static(__dirname + '/public'));
// // html 파일 읽기위해 사용함
app.set('views', __dirname + '/views');
app.engine('html', engine.mustache);
app.set('view engine', 'html');
// 나는 이거 왜 필요한지 모르겠다.. 선장님이 좀 알려주셈/ 없어도 실행 잘 되긴함.

var app= http.createServer('/',function(req,res){
    var _url = req.url;
    var queryData = url.parse(_url, true).query;
        if(queryData.id === undefined){
          fs.readdir('./views', function(error, filelist){
          var title = 'main';
          var list = template.list(filelist);
          var html = template.HTML(title,list,`<h2>${title}</h2>`);
          res.writeHead(200);
          res.end(html);
          })
        }
        else{
          fs.readdir('./views', function(error, filelist){
            fs.readFile(`views/${queryData.id}.html`, 'utf8', function(err, description){
                title = queryData.id;
                list = template.list(filelist);
                template = template.HTML(title,list,description);
                res.end(template);
            });
            });
        }
});
app.listen(3000);
