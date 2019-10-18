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
            <iframe class="us" src="/ContactFrom_v4/index.html"  frameborder="0" width="600px" height="1000px" scrolling="no" transform: scale(0.85, 0.85)></iframe>
            <iframe class ="map"src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3173.9478030084747!2d126.83762491316851!3d37.29637089246949!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357b6eec49aeb76f%3A0xe2bf1f1c6de448ce!2z7JWI7IKw7IucIOyCrDPrj5kg7ZWc7JaR64yA7ZWZ6rWQIO2VmeyXsOyCsO2BtOufrOyKpO2EsA!5e0!3m2!1sko!2skr!4v1571373050963!5m2!1sko!2skr" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen=""></iframe>
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