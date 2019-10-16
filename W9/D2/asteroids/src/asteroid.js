// Spacerock.It inherits from MovingObject.
const util = require("./util.js");
const MovingObject = require("./moving_object.js");
util.inherits(Asteroid, MovingObject);
const Ship = require("./ship.js");

function Asteroid(options) {

  // const randomNumber = () => (Math.random() < 0.5 ? -1 : 1) * Math.random() * 10;
  // let asteroid = new MovingObject(pos, [randomNumber(), randomNumber()] , Math.random() * 50 + 100, 'grey');
  // util.inherits(Asteroid, asteroid);
  this.pos = options.pos;
  this.vel = util.randomVec(5);
  this.radius = 30; // Math.random() * 50 + 100;
  this.color = 'gray';
  this.imageElement = document.getElementById('youngjun');

  // MovingObject.call(this, options);

  // let asteroid = new MovingObject(pos, util.randomVec(10), Math.random() * 50 + 100, 'grey');

}

Asteroid.prototype.isCollidedWith = function (otherObject) {
  let x_1 = this.pos[0];
  let y_1 = this.pos[1];
  let x_2 = otherObject.pos[0];
  let y_2 = otherObject.pos[1];

  let distance = Math.sqrt(Math.pow((x_1 - x_2), 2) + Math.pow((y_1 - y_2), 2));

  if (distance < this.radius + otherObject.radius && this !== otherObject) {
    // this.color = 'red';
    // otherObject.color = 'blue';
    if (otherObject instanceof Ship) {
      otherObject.relocate();
    }
    return true;
  }
  return false;
};


Asteroid.prototype.draw = function (ctx) {
  ctx.drawImage(this.imageElement, this.pos[0], this.pos[1], this.radius*2, this.radius*2)
};


module.exports = Asteroid;