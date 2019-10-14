module.exports = {
    HTML: function(title, list, feature) {
        return `
      <!DOCTYPE html>
      <html>
      <head >
          <meta charset="utf-8" />
          <link href="css/main.css" type="text/css" rel="stylesheet" />
      </head>

      <body class="test">
          <h1 class = "test"><a href="">This is ${title}</a></h1>
          ${list}
          </nav>
          <a href="?id=login">LOGIN</a>
          <a href="?id=contact">CONTACT</a>
          ${feature}
      </body>
      </html>
      `;
    },
    list: function(filelist) {
        var list = '<nav id="topMenu" ><ul>';
        var i = 0;
        while (i < filelist.length) {
            var title = filelist[i].split('.')[0];
            list = list + `<li><a class="menuLink" href="/?id=${title}">${title}</a></li>`;
            i = i + 1;
        }
        list = list + '</ul></nav>';
        return list;
    }
}
