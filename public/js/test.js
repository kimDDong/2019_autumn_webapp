var http = require('http');
var fs = require('fs');
var url = require('url');
 
function templateHTML(title,list,body) {
    return `
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="utf-8" />
        <link href="css/main.css?ver=1" type="text/css" rel="stylesheet" />
        <title>SE LAB - ${title}</title>
    </head>

    <body>
        <h1>This is ${title}</h1>
        ${list}
        <a href="?id=login">LOGIN</a>
        <a href="?id=contact">CONTACT</a>
        ${body}
    </body>
    </html>
    `;
}

function templateList(filelist) {
    var list = '<ul>';
    var i = 0;
    while(i < filelist.length){
        list = list + `<li><a href="/?id=${filelist[i]}">${filelist[i]}</a></li>`;
        i = i + 1;
    }
    list = list+'</ul>';

    return list;
}

fs.readdir('./data', function(error, filelist){
    var title = 'Welcome';
    var description = 'Hello, Node.js';
    // var list = templateList(filelist)
    // var template = templateHTML(title,list,`<h2>${title}</h2><p>${description}</p>`);
})