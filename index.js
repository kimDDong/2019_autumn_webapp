var engine = require('consolidate');
var express = require('express');
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

app.get('/',function(req,res){
    var _url = req.url;
    var queryData = url.parse(_url, true).query;
    fs.readdir('views', function(error, filelist){
        var title = 'main';
        var _template = '';
        var _list = '';
        if(req.query.id === undefined){
            _list = template.list(filelist)
            _template = template.HTML(title,_list,`<h2>${title}</h2>`);
            res.end(_template);
        }
        else if ( req.query.id === 'members'){
          db.query('SELECT * FROM nav', function(error, nav) {
            db.query('SELECT * FROM members', function(error, members) {
              title = queryData.id;
              _list = '<ul>';
              var i = 0;
              while(i < nav.length){
                  _list = _list + `<li><a href="/?id=${nav[i].menu}">${nav[i].menu}</a></li>`;
                  i = i + 1;
              }
              _list = _list+'</ul>';
              _template = template.HTML(title,_list,`
                <div class = "position">
                  <h2> Professor </h2>
                  <div class = "human">
                    <img class="photo" src="https://selab.hanyang.ac.kr/members/photos/scott.jpg" alt= "not image">
                    <ul>
                      <li> Name  : ${members[0].name}</li>
                      <li> E-mail : ${members[0].email}</li>
                      <li> site : ${members[0].site}</li>
                      <li> information : </li>
                      <li> Career : ${members[0].etc}</li>
                    </ul>
                  </div>
                </div>
                `);
              res.end(_template);
          });
          });
        }
        else{
            fs.readFile(`views/${queryData.id}.html`, 'utf8', function(err, description){
                title = queryData.id;
                _list = template.list(filelist)
                _template = template.HTML(title,_list,description);
                res.end(_template);
            });
        }
    })


});



app.listen(3000,function () {
    console.log('Server start, port : 3000');
});
