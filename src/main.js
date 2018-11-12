'use strict';

require('./style/main.scss');
require('./asset/default_avatar.png');

const firebase = require('firebase');
const { Elm } = require('./Main.elm');

const config = {
    apiKey: "<API_KEY>",
    authDomain: "<PROJECT_ID>.firebaseapp.com",
    projectId: "<PROJECT_ID>",
};
firebase.initializeApp(config);

const app = Elm.Main.init({
    node: document.getElementById('app')
});

app.ports.logIn.subscribe(() => {
    const provider = new firebase.auth.GoogleAuthProvider();
    firebase.auth().signInWithPopup(provider);
});

app.ports.logOut.subscribe(() => {
    firebase.auth().signOut();
});

firebase.auth().onAuthStateChanged((user) => {
    if (user) {
        const currentUser = firebase.auth().currentUser
        app.ports.setLoginUser.send({
            name: currentUser.displayName || 'Anonymous',
            avatar: currentUser.photoURL || 'default_avatar.png',
        });
    } else {
        app.ports.unsetLoginUser.send();
    }
});
