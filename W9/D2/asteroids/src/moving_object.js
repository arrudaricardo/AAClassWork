// Base class for anything that moves.
// Most important methods are MovingObject.prototype.move, MovingObject.prototype.draw(ctx), MovingObject.prototype.isCollidedWith(otherMovingObject).

 function MovingObject(options) {
    this.pos = options.pos;
    this.vel = options.vel;
    this.radius = options.radius;
    this.color = options.color;
  }

MovingObject.prototype.draw = function(ctx) {
  
  ctx.fillStyle = this.color;
  ctx.beginPath();  
  ctx.ellipse(this.pos[0], this.pos[1], this.radius, this.radius, 0, 0, 2*Math.PI);
  // ctx.stroke();
  ctx.fill();

};

MovingObject.prototype.move = function () {
  // newPos = oldPos + vel*time
  this.pos[0] += this.vel[0];
  this.pos[1] += this.vel[1];

};

MovingObject.prototype.isCollidedWith = function(otherObject) {
  let x_1 = this.pos[0];
  let y_1 = this.pos[1];
  let x_2 = otherObject.pos[0];
  let y_2 = otherObject.pos[1];

  let distance = Math.sqrt(Math.pow((x_1 - x_2), 2) + Math.pow((y_1 - y_2), 2));
  // console.log('outside')
  if (distance < this.radius + otherObject.radius && this !== otherObject) {
    // this.color = 'red';
    // otherObject.color = 'blue';
    // console.log('hit')
    // console.log(this);
    
    return true;
  }
  return false;
};


module.exports = MovingObject;
