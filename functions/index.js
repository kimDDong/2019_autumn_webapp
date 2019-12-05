const functions = require('firebase-functions');
const admin = require('firebase-admin');
var firebase = require("firebase/app");
var config = require('./src/config');



// Add the Firebase products that you want to use
require("firebase/auth");
require("firebase/firestore");

firebase.initializeApp(config.api());
admin.initializeApp();

// exports.helloWorld = functions.https.onRequest((request, response) => {
//     response.send("Hello from Firebase!");
// });


exports.sendQuizNotifi = functions.firestore
    .document('quiz/{quizId}')
    .onCreate(async snapshot => {

        var db = admin.firestore();

        const quiz = snapshot.data();
        const querySnapshot = await db.collection('tokens').get();
        const getTokens = querySnapshot.docs.map(snap => snap.data().token);

        const message = {
            notification: {
                title: 'SELAB Quiz',
                body: 'Quiz Will be on '+quiz.startTime.toDate().toLocaleString('ko-KR', {timeZone: "Asia/Seoul"}),
            },
            tokens: getTokens
        };

        admin.messaging().sendMulticast(message)
            .then((response) => {
                // Response is a message ID string.
                console.log('Successfully sent message:', response);
                return null;
            })
            .catch((error) => {
                console.log('Error sending message:', error);
                throw new Error("Profile doesn't exist");
            });
    });

exports.sendNoticeNotifi = functions.firestore
    .document('notice/{noticeId}')
    .onCreate(async snapshot => {

        var db = admin.firestore();

        const notice = snapshot.data();
        const querySnapshot = await db.collection('tokens').get();
        const getTokens = querySnapshot.docs.map(snap => snap.data().token);


        const message = {
            notification: {
                title: 'SELAB Notice',
                body: notice.title,
            },
            tokens: getTokens
        };

        admin.messaging().sendMulticast(message)
            .then((response) => {
                // Response is a message ID string.
                console.log('Successfully sent message:', response);
                return null;
            })
            .catch((error) => {
                console.log('Error sending message:', error);
                throw new Error("Profile doesn't exist");
            });
    });

exports.sendQuestionNotifi2Adimin = functions.firestore
    .document('question/{questionId}')
    .onCreate(async snapshot => {

        var db = admin.firestore();

        const question = snapshot.data();
        const querySnapshot = await db.collection('admin').get();
        const getTokens = querySnapshot.docs.map(snap => snap.data().token);


        const message = {
            notification: {
                title: 'SELAB Q&A',
                body: "New Question : " + question.title,
            },
            tokens: getTokens
        };

        admin.messaging().sendMulticast(message)
            .then((response) => {
                // Response is a message ID string.
                console.log('Successfully sent message:', response);
                return null;
            })
            .catch((error) => {
                console.log('Error sending message:', error);
                throw new Error("Profile doesn't exist");
            });
    });

exports.sendAnswerNotifi2Questioner = functions.firestore
    .document('answer/{answerId}')
    .onCreate(async snapshot => {

        var db = admin.firestore();

        const answer = snapshot.data();
        const querySnapshot = await db.collection('admin').doc(answer.questioner).get();
        const getTokens = querySnapshot.docs.map(snap => snap.data().token);


        const message = {
            notification: {
                title: 'SELAB Q&A',
                body: "Reply for your Question",
            },
            tokens: getTokens
        };

        admin.messaging().sendMulticast(message)
            .then((response) => {
                // Response is a message ID string.
                console.log('Successfully sent message:', response);
                return null;
            })
            .catch((error) => {
                console.log('Error sending message:', error);
                throw new Error("Profile doesn't exist");
            });
    });