// This is you! Another MovingObject subclass.
const util = require("./util.js");
const MovingObject = require("./moving_object.js");
util.inherits(Ship, MovingObject);
const Bullet = require("./bullet.js");

function Ship(pos) {
  this.pos = pos
  this.radius = 20;
  this.COLOR = 'green';
  this.vel = [0, 0];
  this.imageElement = document.getElementById('rocket');
  this.bindKeyHandlers();
}

Ship.prototype.relocate = function() {
  // call game randomPosition
  // this.pos = 
}




Ship.prototype.power = function (impulse) {
  this.vel[0] += impulse[0];
  this.vel[1] += impulse[1];
}

Ship.prototype.bindKeyHandlers = function () {
  let that = this;
  key('up', function () { that.power([0, -1]);});
  key('down', function () { that.power([0, 1]);});

  key('left', function () { that.power([-1, 0]);});
  key('right', function () { that.power([1, 0]);});


}



Ship.prototype.draw = function (ctx) {
  ctx.drawImage(this.imageElement,this.pos[0], this.pos[1], this.radius *5, this.radius *5)
  

  // ctx.fillStyle = this.COLOR;
  // ctx.beginPath();
  // ctx.ellipse(this.pos[0], this.pos[1], this.radius, this.radius, 0, 0, 2 * Math.PI);
  // ctx.stroke();
  // ctx.fill();

};


Ship.prototype.fireBullet = function() {
  let bullet = new Bullet(this.pos);
  // bullet.vel = [this.vel[0] * 5, this.vel[1] * 5];
  return bullet;
};


module.exports = Ship;
