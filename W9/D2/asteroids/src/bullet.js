// Kill spacerocks with this.Also a MovingObject subclass.
const util = require("./util.js");
const MovingObject = require("./moving_object.js");
util.inherits(Bullet, MovingObject);

function Bullet (pos) {
  this.radius = 10;
  this.pos = pos;
  this.vel = [5, 5]; //replace with vector direction of ship
}

Bullet.prototype.draw = function (ctx) {

  ctx.fillStyle = 'red';
  ctx.beginPath();
  ctx.ellipse(this.pos[0], this.pos[1], this.radius, this.radius, 0, 0, 2 * Math.PI);
  // ctx.stroke();
  ctx.fill();

};

// Bullet.prototype

module.exports = Bullet;

