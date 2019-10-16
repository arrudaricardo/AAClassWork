// Stores a Game instance.
// Stores a canvas context to draw the game into.
// Installs key listeners to move the ship and fire bullets.
// Installs a timer to call Game.prototype.step.

function GameView(game) {
  this.game = game;
  // this.timestamp = 0;
}

GameView.prototype.start = function(ctx) {
  
  setInterval(
    () => { 
      this.game.moveObjects();
      this.game.draw(ctx);
      this.game.checkCollision();
      this.game.displayPoints();
     }, 20
  );
};

module.exports = GameView;