Board.prototype.getPiece = function (pos) {
  if (this.grid[pos[0]][pos[1]] /*this.isValidPos(pos) && this.grid[pos[0]][pos[1]] instanceof Piece*/) {
    return this.grid[pos[0]][pos[1]];
  } else {
    throw "Position Invalid";
  }
};

/**
 * Checks if there are any valid moves for the given color.
 */
Board.prototype.hasMove = function (color) {
  // if ()
};

/**
 * Checks if the piece at a given position
 * matches a given color.
 */
Board.prototype.isMine = function (pos, color) {
};

/**
 * Checks if a given position has a piece on it.
 */
Board.prototype.isOccupied = function (pos) {
};

/**
 * Checks if both the white player and
 * the black player are out of moves.
 */
Board.prototype.isOver = function () {
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