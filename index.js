var engine = require('consolidate');
var express = require('express')
var http = require('http');
var fs = require('fs');
var url = require('url');
var qs = require('querystring');
var template = require('./public/js/template')
var db = require('./public/js/db')
var app = express();

app.use(express.static(__dirname + '/public'));

// html 파일 읽기위해 사용함
app.set('views', __dirname + '/views');
app.engine('html', engine.mustache);
app.set('view engine', 'html');
// 여기까지

function templateHTML(title, list, feature) {
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



app.get('/', function(req, res) {
    var _url = req.url;
    var queryData = url.parse(_url, true).query;
    fs.readdir('views', function(error, filelist) {
        var title = 'main';
        var _template = '';
        var _list = '';
        if (req.query.id === undefined || req.query.id === 'main') {
            _list = template.list(filelist)
            _template = template.HTML(title, _list, `<h2>${title}</h2>`);
            res.end(_template);
        } else {
            fs.readFile(`views/${queryData.id}.html`, 'utf8', function(err, description) {
                title = queryData.id;
                _list = template.list(filelist)
                _template = template.HTML(title, _list, description);
                res.end(_template);
            });
        }
    });
});

app.post("/create_process",function(req,res){
  var title=req.body.title;
  var name = req.body.name;

  var description = req.body.description;
  fs.writeFile(`data/${title}`,`name:${name}, description:${description}`,'utf8',function(err){
    res.writeHead(302,{'Location':"/?id=notice"})
    res.end();
  });
});



app.listen(3000, function() {
    console.log('Server start, port : 3000');

});
