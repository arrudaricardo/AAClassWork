// Holds collections of the asteroids, bullets, and your ship.
//   Game.prototype.step method calls Game.prototype.move on all the objects, and Game.prototype.checkCollisions checks for colliding objects.
//     Game.prototype.draw(ctx) draws the game.
// Keeps track of dimensions of the space; wraps objects around when they drift off the screen.
const Asteroid = require("./asteroid.js");
window.Asteroid = Asteroid;
const Ship = require("./ship.js");
const Bullet = require("./bullet.js");

function Game() {
  this.DIM_X = 1600;
  this.DIM_Y = 700;
  this.NUM_ASTEROIDS = 10;
  this.asteroids = [];
  this.addAsteroids();
  this.ship = this.randomPosition();
  this.bullets = [];
  this.addBullets();
  this.counter = 0;
  this.score = 0;
  this.highscore = 0;
}

Game.prototype.addAsteroids = function() {
  let COLORS = ['blue', 'pink', 'orange', 'gray', 'red', 'black', 'yellow'];
  for (let i = 0; i < this.NUM_ASTEROIDS; i++) {
    
    let color = COLORS[Math.floor(Math.random() * COLORS.length)];
    let asteroid = new Asteroid({ pos: [Math.random() * this.DIM_X, Math.random() * this.DIM_Y] })
    asteroid.color = color;
    this.asteroids.push(asteroid);
  }
};

Game.prototype.addBullets = function () {
  let that = this;
  key('space', function () { that.bullets.push(that.ship.fireBullet()) });
};

Game.prototype.draw = function(ctx) {
  ctx.clearRect(0, 0, this.DIM_X, this.DIM_Y)  // clear canvas

  this.allObjects().forEach((movingObject) => { movingObject.draw(ctx); });
};

Game.prototype.moveObjects = function() {
  this.allObjects().forEach((movingObject) => { 

    movingObject.move(); 
    this.wrap(movingObject);

  });
};

Game.prototype.wrap = function(movingObject){
  
  if (movingObject.pos[0] > this.DIM_X) {
    movingObject.pos[0] = 1;

  } else if (movingObject.pos[0] < 0) {
    movingObject.pos[0] = this.DIM_X;

  } else if (movingObject.pos[1] > this.DIM_Y) {
    movingObject.pos[1] = 1;

  } else if (movingObject.pos[1] < 0) {
    movingObject.pos[1] = this.DIM_Y;
  };

};

Game.prototype.displayPoints = function() {
  this.score++
  document.getElementById('score').innerText = `Score: ${this.score}     High Score: ${this.highscore}`
}

Game.prototype.checkCollision = function() {
  this.allObjects().forEach ( (obj1) => {
    this.allObjects().forEach ( (obj2) => {
      if (obj1.isCollidedWith(obj2)) {
        if (obj1 instanceof Ship || obj2 instanceof Ship) {
          if (!(obj1 instanceof Bullet) && !(obj2 instanceof Bullet)) {
            console.log('randompos');
            this.ship = this.randomPosition();

            this.bullets = [];
            // alert('HIT');
            this.counter++; 
            document.getElementById('counter').innerText = `Deaths: ${this.counter/2}`
            if (this.score > this.highscore) {
              this.highscore = this.score;
            }
            this.score = 0;
            
          } 
        } 
        
        // alert('HIT');
        // this.remove(asteroid1);
        // this.remove(asteroid2);
        // explode(this.pos[0], this.pos[1])
      }
    });
  });
};

Game.prototype.remove = function(asteroid) {
  
  this.asteroids = this.asteroids.filter(e => e != asteroid)
};

Game.prototype.randomPosition = function() {
  return new Ship([Math.random() * this.DIM_X, Math.random() * this.DIM_Y])
}

Game.prototype.allObjects = function() {
  return this.asteroids.concat(this.ship).concat(this.bullets);
}

module.exports = Game;
