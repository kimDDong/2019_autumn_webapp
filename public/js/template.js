var db = require('./db')



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
          ${list}
          ${feature}
          <div class="contact">
          <iframe src="/ContactFrom_v13/contact.html"  frameborder="0" width="100%" height="1000px" scrolling="no" transform: scale(0.85, 0.85)>
          </div>
      </body>
      </html>
      `;
    },
    list: function() {
        var list = `
        <nav id="topMenu" >
            <ul>
                <li><a href="?id=main"><img id="logo" src="https://selab.hanyang.ac.kr/common/images/selab_logo_S.png" alt=""></a></li>
                <li><a href="?id=notice">NOTICE</a></li>
                <li><a href="?id=members">MEMBERS</a></li>
                <li><a href="?id=research">RESEARCH</a></li>
                <li><a href="?id=publications">PUBLICATIONS</a></li>
                <li><a href="?id=courses">COURSES</a></li>
                <li><a href="?id=gallery">GALLERY</a></li>
            </ul>
        </nav>`


        return list;
    },
    membersDB: function() {
        var member_list = '';


        db.query('SELECT * FROM members', function(err, members) {
            if (err) {
                console.log(err);
            }
            for (var i = 0; i < members.length; i++) {
                member_list = member_list +
                    `
                <img class = "photo" src = "${members[i].img_url}" alt="not image">
                <ul>
                <li> Name : ${members[i].name}</li>
                <li> E-mail : ${members[i].email}</li>
                <li> site : ${members[i].site}</li>
                <li> interest : ${members[i].interest}</li>
                <li> Career : ${members[i].etc}</li>
                </ul>
                `
            }
        })
        return member_list;

    }

}