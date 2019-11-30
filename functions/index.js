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
        const querySnapshot = await db.collection('device').get();
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
        const querySnapshot = await db.collection('device').get();
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

exports.aggregateRatings = functions.firestore
    .document('quiz/{quizId}/')
    .onWrite((change, context) => {

        var db = admin.firestore();
        var ratingVal = change.after.data().answerer[0];

        // Get a reference to the restaurant
        var restRef = db.collection('quiz').doc(context.params.quizId);

        // Update aggregations in a transaction
        return db.runTransaction(transaction => {
            return transaction.get(restRef).then(restDoc => {
                // Compute new number of ratings
                var newNumRatings = restDoc.data().numRatings + 1;

                // Compute new average rating
                var oldRatingTotal = restDoc.data().avgRating * restDoc.data().numRatings;
                var newAvgRating = (oldRatingTotal + ratingVal) / newNumRatings;

                // Update restaurant info
                return transaction.update(restRef, {
                    avgRating: newAvgRating,
                    numRatings: newNumRatings
                });
            });
        });
    });