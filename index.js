var engine = require('consolidate');
var express = require('express');
var mysql = require('mysql');
var http = require('http');
var fs = require('fs');
var url = require('url');


var app = express();




app.use(express.static(__dirname + '/public'));

// html 파일 읽기위해 사용함
app.set('views', __dirname + '/views');
app.engine('html', engine.mustache);
app.set('view engine', 'html');
// 여기까지

function templateHTML(title,list,feature) {
    return `
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="utf-8" />
        <link href="css/main.css?ver=1" type="text/css" rel="stylesheet" />
    </head>

    <body>
        <h1><a href="">This is ${title}</a></h1>
        ${list}
        <a href="?id=login">LOGIN</a>
        <a href="?id=contact">CONTACT</a>
        ${feature}

    </body>
    </html>
    `;
}

function templateList(filelist) {
    var list = '<ul>';
    var i = 0;
    while(i < filelist.length){
        var title = filelist[i].split('.')[0];
        list = list + `<li><a href="/?id=${title}">${title}</a></li>`;
        i = i + 1;
    }
    list = list+'</ul>';
    return list;
}

var connection = mysql.createConnection({
	host: 'localhost',
	user: 'root',

	post: 3306,

	password: 'oracle11',
	database: 'my_db'
});

app.get('/',function(req,res){
    var _url = req.url;
    var queryData = url.parse(_url, true).query;
    fs.readdir('views', function(error, filelist){
        var title = 'main';
        var template;
        var list;
        if(req.query.id === undefined || req.query.id === 'main'){
            list = templateList(filelist)
            template = templateHTML(title,list,`<h2>${title}</h2>`);
            res.end(template);
        }
        else{
            fs.readFile(`views/${queryData.id}.html`, 'utf8', function(err, description){
                title = queryData.id;
                list = templateList(filelist)
                template = templateHTML(title,list,description);
                res.end(template);
            });
        }
    })


});



app.listen(3000,function () {
    console.log('Server start, port : 3000');
});
