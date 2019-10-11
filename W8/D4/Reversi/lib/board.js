let Piece = require("./piece");

/**
 * Returns a 2D array (8 by 8) with two black pieces at [3, 4] and [4, 3]
 * and two white pieces at [3, 3] and [4, 4]
 */
function _makeGrid () {
  const grid = [];
  for (let i = 0; i < 8; i++ ){
    grid.push(new Array(8));
  }
  grid[3][4] = new Piece("black");
  grid[4][3] = new Piece("black");

  grid[3][3] = new Piece("white");
  grid[4][4] = new Piece("white");

  return grid;
}

/**
 * Constructs a Board with a starting grid set up.
 */
function Board () {
  this.grid = _makeGrid();
}

Board.DIRS = [
  [ 0,  1], [ 1,  1], [ 1,  0],
  [ 1, -1], [ 0, -1], [-1, -1],
  [-1,  0], [-1,  1]
];

/**
 * Returns the piece at a given [x, y] position,
 * throwing an Error if the position is invalid.
 */
Board.prototype.getPiece = function (pos) {
  if (this.isValidPos(pos) /*this.isValidPos(pos) && this.grid[pos[0]][pos[1]] instanceof Piece*/) {
    return this.grid[pos[0]][pos[1]];
  } else {
    throw new Error("Not valid pos!");
  }
};

/**
 * Checks if there are any valid moves for the given color.
 */
Board.prototype.hasMove = function (color) {
  return this.validMoves(color).length > 0

};

/**
 * Checks if the piece at a given position
 * matches a given color.
 */
Board.prototype.isMine = function (pos, color) {
  let piece = this.getPiece(pos);

  if (!this.isOccupied(pos)){ //does not have a piece
    return false;
  } else if (piece.color === color) { //my piece
    return true;
  } else { //has a piece but noy my color
    return false;
  }

};

/**
 * Checks if a given position has a piece on it.
 */
Board.prototype.isOccupied = function (pos) {
  return  !(this.getPiece(pos) === undefined);
};

/**
 * Checks if both the white player and
 * the black player are out of moves.
 */
Board.prototype.isOver = function () {
  let valid = false;
  ['white','black'].forEach(
    (el) => {
      if (!this.hasMove(el)){
        valid = true;
      }
    }
  ); 
  return valid;
};

/**
 * Checks if a given position is on the Board.
 */
Board.prototype.isValidPos = function (pos) {
  if (pos[0] < 8 && pos[0] >= 0 && pos[1] < 8 && pos[1] >= 0) {
    return true;
  } else {
    return false;
  }

};
/**
 * Recursively follows a direction away from a starting position, adding each
 * piece of the opposite color until hitting another piece of the current color.
 * It then returns an array of all pieces between the starting position and
 * ending position.
 *
 * Returns null if it reaches the end of the board before finding another piece
 * of the same color.
 *
 * Returns null if it hits an empty position.
 *
 * Returns null if no pieces of the opposite color are found.
 */
function _positionsToFlip (board, pos, color, dir, piecesToFlip=[]) {
    let counter = 1;
  while (true){
    const current_pos = [pos[0] + dir[0] * counter, pos[1] + dir[1] * counter];
    // console.log(`starting at ${pos} - next ${current_pos} piecetf = ${piecesToFlip}`)
    if (!board.isValidPos(current_pos)){  //end of board
      return null; //"end of board";
    }
    
    if (!board.isMine(current_pos, color)){ //if not my piece and not undefined

      piecesToFlip.push(current_pos);

    } 
    if (!board.isOccupied(current_pos)){ //not occuped == undefined
      return null; //'empty pos';
    } 

    if (board.isMine(current_pos, color) && piecesToFlip.length > 0) { //if my piece

      return piecesToFlip;

    }


    counter++;
  }

}

/**
 * Adds a new piece of the given color to the given position, flipping the
 * color of any pieces that are eligible for flipping.
 *
 * Throws an error if the position represents an invalid move.
 */
Board.prototype.placePiece = function (pos, color) {
  if (this.validMove(pos,color) === false) {
    throw Error("Invalid Move");
  }

  this.grid[pos[0]][pos[1]]= new Piece(color);
  const flipPos = [];

  Board.DIRS.forEach( (dir) => {

    if (_positionsToFlip(this, pos, color, dir) !== null) {
      flipPos.push([].concat(..._positionsToFlip(this, pos, color, dir)) ); // 2d array
    }
    
    });

    // console.log(flipPos);
    flipPos.forEach(

          (position) => {
            this.grid[position[0]][position[1]].flip();
          }
        );
  
  


};

/**
 * Prints a string representation of the Board to the console.
 */
Board.prototype.print = function () {
};

/**
 * Checks that a position is not already occupied and that the color
 * taking the position will result in some pieces of the opposite
 * color being flipped.
 */
Board.prototype.validMove = function (pos, color) {
  if (this.isOccupied(pos)){
    return false;
  }
  let valid = false;

  Board.DIRS.forEach( (dir) => {
    if (_positionsToFlip(this, pos, color, dir) !== null){
      valid = true;
      // return true;
    }
  });
  return valid;
};

/**
 * Produces an array of all valid positions on
 * the Board for a given color.
 */
Board.prototype.validMoves = function (color) {
  const valid_moves = [];
  for (let i = 0; i < this.grid.length; i++) {
    for (let j = 0; j < this.grid.length; j++){
      if(this.validMove([i,j], color)){
        valid_moves.push([i,j]);
      }
    }
  }
  return valid_moves;
};

module.exports = Board;
 /*
 let b = new Board();
 */