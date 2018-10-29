'use strict';

require('./style/main.scss');
require('./asset/default_avatar.png');

const { Elm } = require('./Main.elm');

const app = Elm.Main.init({
    node: document.getElementById('app')
});
