/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./src/index.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./src/asteroid.js":
/*!*************************!*\
  !*** ./src/asteroid.js ***!
  \*************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("// Spacerock.It inherits from MovingObject.\nconst util = __webpack_require__(/*! ./util.js */ \"./src/util.js\");\nconst MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\nutil.inherits(Asteroid, MovingObject);\nconst Ship = __webpack_require__(/*! ./ship.js */ \"./src/ship.js\");\n\nfunction Asteroid(options) {\n\n  // const randomNumber = () => (Math.random() < 0.5 ? -1 : 1) * Math.random() * 10;\n  // let asteroid = new MovingObject(pos, [randomNumber(), randomNumber()] , Math.random() * 50 + 100, 'grey');\n  // util.inherits(Asteroid, asteroid);\n  this.pos = options.pos;\n  this.vel = util.randomVec(5);\n  this.radius = 30; // Math.random() * 50 + 100;\n  this.color = 'gray';\n  this.imageElement = document.getElementById('youngjun');\n\n  // MovingObject.call(this, options);\n\n  // let asteroid = new MovingObject(pos, util.randomVec(10), Math.random() * 50 + 100, 'grey');\n\n}\n\nAsteroid.prototype.isCollidedWith = function (otherObject) {\n  let x_1 = this.pos[0];\n  let y_1 = this.pos[1];\n  let x_2 = otherObject.pos[0];\n  let y_2 = otherObject.pos[1];\n\n  let distance = Math.sqrt(Math.pow((x_1 - x_2), 2) + Math.pow((y_1 - y_2), 2));\n\n  if (distance < this.radius + otherObject.radius && this !== otherObject) {\n    // this.color = 'red';\n    // otherObject.color = 'blue';\n    if (otherObject instanceof Ship) {\n      otherObject.relocate();\n    }\n    return true;\n  }\n  return false;\n};\n\n\nAsteroid.prototype.draw = function (ctx) {\n  ctx.drawImage(this.imageElement, this.pos[0], this.pos[1], this.radius*2, this.radius*2)\n};\n\n\nmodule.exports = Asteroid;\n\n//# sourceURL=webpack:///./src/asteroid.js?");

/***/ }),

/***/ "./src/bullet.js":
/*!***********************!*\
  !*** ./src/bullet.js ***!
  \***********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("// Kill spacerocks with this.Also a MovingObject subclass.\nconst util = __webpack_require__(/*! ./util.js */ \"./src/util.js\");\nconst MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\nutil.inherits(Bullet, MovingObject);\n\nfunction Bullet (pos) {\n  this.radius = 10;\n  this.pos = pos;\n  this.vel = [5, 5]; //replace with vector direction of ship\n}\n\nBullet.prototype.draw = function (ctx) {\n\n  ctx.fillStyle = 'red';\n  ctx.beginPath();\n  ctx.ellipse(this.pos[0], this.pos[1], this.radius, this.radius, 0, 0, 2 * Math.PI);\n  // ctx.stroke();\n  ctx.fill();\n\n};\n\n// Bullet.prototype\n\nmodule.exports = Bullet;\n\n\n\n//# sourceURL=webpack:///./src/bullet.js?");

/***/ }),

/***/ "./src/game.js":
/*!*********************!*\
  !*** ./src/game.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("// Holds collections of the asteroids, bullets, and your ship.\n//   Game.prototype.step method calls Game.prototype.move on all the objects, and Game.prototype.checkCollisions checks for colliding objects.\n//     Game.prototype.draw(ctx) draws the game.\n// Keeps track of dimensions of the space; wraps objects around when they drift off the screen.\nconst Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\");\nwindow.Asteroid = Asteroid;\nconst Ship = __webpack_require__(/*! ./ship.js */ \"./src/ship.js\");\nconst Bullet = __webpack_require__(/*! ./bullet.js */ \"./src/bullet.js\");\n\nfunction Game() {\n  this.DIM_X = 1600;\n  this.DIM_Y = 700;\n  this.NUM_ASTEROIDS = 10;\n  this.asteroids = [];\n  this.addAsteroids();\n  this.ship = this.randomPosition();\n  this.bullets = [];\n  this.addBullets();\n  this.counter = 0;\n  this.score = 0;\n  this.highscore = 0;\n}\n\nGame.prototype.addAsteroids = function() {\n  let COLORS = ['blue', 'pink', 'orange', 'gray', 'red', 'black', 'yellow'];\n  for (let i = 0; i < this.NUM_ASTEROIDS; i++) {\n    \n    let color = COLORS[Math.floor(Math.random() * COLORS.length)];\n    let asteroid = new Asteroid({ pos: [Math.random() * this.DIM_X, Math.random() * this.DIM_Y] })\n    asteroid.color = color;\n    this.asteroids.push(asteroid);\n  }\n};\n\nGame.prototype.addBullets = function () {\n  let that = this;\n  key('space', function () { that.bullets.push(that.ship.fireBullet()) });\n};\n\nGame.prototype.draw = function(ctx) {\n  ctx.clearRect(0, 0, this.DIM_X, this.DIM_Y)  // clear canvas\n\n  this.allObjects().forEach((movingObject) => { movingObject.draw(ctx); });\n};\n\nGame.prototype.moveObjects = function() {\n  this.allObjects().forEach((movingObject) => { \n\n    movingObject.move(); \n    this.wrap(movingObject);\n\n  });\n};\n\nGame.prototype.wrap = function(movingObject){\n  \n  if (movingObject.pos[0] > this.DIM_X) {\n    movingObject.pos[0] = 1;\n\n  } else if (movingObject.pos[0] < 0) {\n    movingObject.pos[0] = this.DIM_X;\n\n  } else if (movingObject.pos[1] > this.DIM_Y) {\n    movingObject.pos[1] = 1;\n\n  } else if (movingObject.pos[1] < 0) {\n    movingObject.pos[1] = this.DIM_Y;\n  };\n\n};\n\nGame.prototype.displayPoints = function() {\n  this.score++\n  document.getElementById('score').innerText = `Score: ${this.score}     High Score: ${this.highscore}`\n}\n\nGame.prototype.checkCollision = function() {\n  this.allObjects().forEach ( (obj1) => {\n    this.allObjects().forEach ( (obj2) => {\n      if (obj1.isCollidedWith(obj2)) {\n        if (obj1 instanceof Ship || obj2 instanceof Ship) {\n          if (!(obj1 instanceof Bullet) && !(obj2 instanceof Bullet)) {\n            console.log('randompos');\n            this.ship = this.randomPosition();\n\n            this.bullets = [];\n            // alert('HIT');\n            this.counter++; \n            document.getElementById('counter').innerText = `Deaths: ${this.counter/2}`\n            if (this.score > this.highscore) {\n              this.highscore = this.score;\n            }\n            this.score = 0;\n            \n          } \n        } \n        \n        // alert('HIT');\n        // this.remove(asteroid1);\n        // this.remove(asteroid2);\n        // explode(this.pos[0], this.pos[1])\n      }\n    });\n  });\n};\n\nGame.prototype.remove = function(asteroid) {\n  \n  this.asteroids = this.asteroids.filter(e => e != asteroid)\n};\n\nGame.prototype.randomPosition = function() {\n  return new Ship([Math.random() * this.DIM_X, Math.random() * this.DIM_Y])\n}\n\nGame.prototype.allObjects = function() {\n  return this.asteroids.concat(this.ship).concat(this.bullets);\n}\n\nmodule.exports = Game;\n\n\n//# sourceURL=webpack:///./src/game.js?");

/***/ }),

/***/ "./src/game_view.js":
/*!**************************!*\
  !*** ./src/game_view.js ***!
  \**************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("// Stores a Game instance.\n// Stores a canvas context to draw the game into.\n// Installs key listeners to move the ship and fire bullets.\n// Installs a timer to call Game.prototype.step.\n\nfunction GameView(game) {\n  this.game = game;\n  // this.timestamp = 0;\n}\n\nGameView.prototype.start = function(ctx) {\n  \n  setInterval(\n    () => { \n      this.game.moveObjects();\n      this.game.draw(ctx);\n      this.game.checkCollision();\n      this.game.displayPoints();\n     }, 20\n  );\n};\n\nmodule.exports = GameView;\n\n//# sourceURL=webpack:///./src/game_view.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("// const MovingObject = require(\"./moving_object.js\");\n// window.MovingObject = MovingObject;\n// const Asteroid = require(\"./asteroid.js\");\n// window.Asteroid = Asteroid;\nconst GameView = __webpack_require__(/*! ./game_view.js */ \"./src/game_view.js\");\nconst Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\");\n\nwindow.addEventListener('DOMContentLoaded', (event) => {\n\n  // const canvas = document.getElementById('game-canvas');\n  // const ctx = canvas.getContext('2d');\n  const ctx = document.getElementById(\"game-canvas\").getContext('2d')\n\n  // test\n  // const testObject = new MovingObject([200,200], [10,20], 50, 'blue')\n  // testObject.draw(ctx);\n\n  let game = new Game();\n  let gameView = new GameView(game);\n  gameView.start(ctx);\n\n\n});\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/moving_object.js":
/*!******************************!*\
  !*** ./src/moving_object.js ***!
  \******************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("// Base class for anything that moves.\n// Most important methods are MovingObject.prototype.move, MovingObject.prototype.draw(ctx), MovingObject.prototype.isCollidedWith(otherMovingObject).\n\n function MovingObject(options) {\n    this.pos = options.pos;\n    this.vel = options.vel;\n    this.radius = options.radius;\n    this.color = options.color;\n  }\n\nMovingObject.prototype.draw = function(ctx) {\n  \n  ctx.fillStyle = this.color;\n  ctx.beginPath();  \n  ctx.ellipse(this.pos[0], this.pos[1], this.radius, this.radius, 0, 0, 2*Math.PI);\n  // ctx.stroke();\n  ctx.fill();\n\n};\n\nMovingObject.prototype.move = function () {\n  // newPos = oldPos + vel*time\n  this.pos[0] += this.vel[0];\n  this.pos[1] += this.vel[1];\n\n};\n\nMovingObject.prototype.isCollidedWith = function(otherObject) {\n  let x_1 = this.pos[0];\n  let y_1 = this.pos[1];\n  let x_2 = otherObject.pos[0];\n  let y_2 = otherObject.pos[1];\n\n  let distance = Math.sqrt(Math.pow((x_1 - x_2), 2) + Math.pow((y_1 - y_2), 2));\n  // console.log('outside')\n  if (distance < this.radius + otherObject.radius && this !== otherObject) {\n    // this.color = 'red';\n    // otherObject.color = 'blue';\n    // console.log('hit')\n    // console.log(this);\n    \n    return true;\n  }\n  return false;\n};\n\n\nmodule.exports = MovingObject;\n\n\n//# sourceURL=webpack:///./src/moving_object.js?");

/***/ }),

/***/ "./src/ship.js":
/*!*********************!*\
  !*** ./src/ship.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("// This is you! Another MovingObject subclass.\nconst util = __webpack_require__(/*! ./util.js */ \"./src/util.js\");\nconst MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\nutil.inherits(Ship, MovingObject);\nconst Bullet = __webpack_require__(/*! ./bullet.js */ \"./src/bullet.js\");\n\nfunction Ship(pos) {\n  this.pos = pos\n  this.radius = 20;\n  this.COLOR = 'green';\n  this.vel = [0, 0];\n  this.imageElement = document.getElementById('rocket');\n  this.bindKeyHandlers();\n}\n\nShip.prototype.relocate = function() {\n  // call game randomPosition\n  // this.pos = \n}\n\n\n\n\nShip.prototype.power = function (impulse) {\n  this.vel[0] += impulse[0];\n  this.vel[1] += impulse[1];\n}\n\nShip.prototype.bindKeyHandlers = function () {\n  let that = this;\n  key('up', function () { that.power([0, -1]);});\n  key('down', function () { that.power([0, 1]);});\n\n  key('left', function () { that.power([-1, 0]);});\n  key('right', function () { that.power([1, 0]);});\n\n\n}\n\n\n\nShip.prototype.draw = function (ctx) {\n  ctx.drawImage(this.imageElement,this.pos[0], this.pos[1], this.radius *5, this.radius *5)\n  \n\n  // ctx.fillStyle = this.COLOR;\n  // ctx.beginPath();\n  // ctx.ellipse(this.pos[0], this.pos[1], this.radius, this.radius, 0, 0, 2 * Math.PI);\n  // ctx.stroke();\n  // ctx.fill();\n\n};\n\n\nShip.prototype.fireBullet = function() {\n  let bullet = new Bullet(this.pos);\n  // bullet.vel = [this.vel[0] * 5, this.vel[1] * 5];\n  return bullet;\n};\n\n\nmodule.exports = Ship;\n\n\n//# sourceURL=webpack:///./src/ship.js?");

/***/ }),

/***/ "./src/util.js":
/*!*********************!*\
  !*** ./src/util.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("// Utility code, especially vector math stuff.\n\nconst Util = {\n  inherits(childClass, parentClass) {\n    function Surrogate() {}\n    Surrogate.prototype = parentClass.prototype;\n    childClass.prototype = new Surrogate();\n    childClass.prototype.constructor = childClass;\n  },\n  \n  randomVec(length) {\n    const deg = 2 * Math.PI * Math.random();\n    return Util.scale([Math.sin(deg), Math.cos(deg)], length);\n  },\n  \n  // Scale the length of a vector by the given amount.\n  scale(vec, m) {\n    return [vec[0] * m, vec[1] * m];\n  }\n\n};\n\nmodule.exports = Util;\n\n//# sourceURL=webpack:///./src/util.js?");

/***/ })

/******/ });