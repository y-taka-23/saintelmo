'use strict';

require('./style/main.scss');

const { Elm } = require('./Main.elm');

const app = Elm.Main.init({
    node: document.getElementById('app')
});
