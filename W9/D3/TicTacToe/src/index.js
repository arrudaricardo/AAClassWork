const View = require('./ttt-view.js'); // require appropriate file
const Game = require('./game.js'); // require appropriate file
// const bark = new Audio('../dist/bark.mp3');
// const meow = new Audio('../dist/meow.mp3');

  $(() => {

    const containerRootEl = $('.ttt');
    const game = new Game();
    const view = new View(game, containerRootEl);

  });
