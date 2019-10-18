var engine = require('consolidate');
var express = require('express')
var http = require('http');
var fs = require('fs');
var url = require('url');
var qs = require('querystring');
var template = require('./public/js/template')
var bodyParser = require("body-parser");
var app = express();

app.use(express.static(__dirname + '/public'));
// html 파일 읽기위해 사용함
app.set('views', __dirname + '/views');
app.engine('html', engine.mustache);
app.set('view engine', 'html');
// 여기까지
//app.use(express.json())
app.use(bodyParser.urlencoded({ extended: true }));

app.get('/', function(req, res) {
    var _url = req.url;
    var queryData = url.parse(_url, true).query;
    fs.readdir('views', function(error, filelist) {
        var title = 'main';
        var _template = '';
        var _list = '';
        var test = '';
        if (req.query.id === undefined) {
            fs.readFile(`views/main.html`, 'utf8', function(err, description) {
                _list = template.list(filelist)
                _template = template.HTML(title, _list, description);

                res.end(_template);
            });
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

// app.post("/create_process", function(req, res) {
//     var title = req.body.title;
//     var name = req.body.name;
//     var description = req.body.description;


//     db.query(`insert into notice(title,name,contents) values("${title}","${name}","${description}")`, function(err, notice) {
//         if (err) {
//             console.log(err);
//         }
//     });
// });


app.listen(3000, function() {
    console.log('Server start, port : 3000');
});