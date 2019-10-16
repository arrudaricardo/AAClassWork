// const MovingObject = require("./moving_object.js");
// window.MovingObject = MovingObject;
// const Asteroid = require("./asteroid.js");
// window.Asteroid = Asteroid;
const GameView = require("./game_view.js");
const Game = require("./game.js");

window.addEventListener('DOMContentLoaded', (event) => {

  // const canvas = document.getElementById('game-canvas');
  // const ctx = canvas.getContext('2d');
  const ctx = document.getElementById("game-canvas").getContext('2d')

  // test
  // const testObject = new MovingObject([200,200], [10,20], 50, 'blue')
  // testObject.draw(ctx);

  let game = new Game();
  let gameView = new GameView(game);
  gameView.start(ctx);


});