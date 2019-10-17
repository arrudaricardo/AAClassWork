class View {
  constructor(game, $el) {
    this.game = game;
    this.root = $el;
    this.setupBoard();
    this.bindEvents();
    
  }

  bindEvents() {
    const that = this;
    $('li').on('click', function (e){
      let target = e.target;
      that.game.playMove(eval(e.target.id));
      that.makeMove(target);
    });

  }

  makeMove($square) {
    let x = eval($square.id)[0];
    let y = eval($square.id)[1]
    let result = this.game.board.grid[x][y];
 

    if (result === "o") {
      $($square).addClass("o");
      meow.play();
     
    } else if (result === "x") {
      $($square).addClass("x");
      bark.play();
      
    }
    let draw = this.game.board.winner() === null ? true : false;

    if (this.game.board.isOver()) {
      for (let i=0; i<3; i++){
        for (let j=0; j<3; j++){
          let winners = this.game.board.grid[i][j];
          if (winners !== result) {
            if (!draw){
              $(`[q='${i}${j}']`).addClass("loser");
            }
          }
        }
      }
      if (draw) {
        $('#winner').text(`The game is a draw!`);
      } else {
        $('#winner').text(`The winner is ${result === 'x' ? '🐕' : '🐈'}!`);
    }
      $("li").off();
      $('li').addClass('noHover');
      let that = this;
      setTimeout(function(){
        that.game.board.reset();
        $("li").removeClass("x o loser");
        $('#winner').text(``);
        that.bindEvents();
        $('li').removeClass('noHover');
      }, 5000);

    }
    
  }

  setupBoard() {
    const boardHTML = $(`<div class = "board">
                      <div> <li q= "00" id="[0,0]"> </li> <li q= "10" id="[1,0]"></li> <li q= "20" id="[2,0]"></li></div>
                      <div><li q= "01" id="[0,1]"></li><li q= "11" id="[1,1]"></li><li q= "21" id="[2,1]"></li></div>
                      <div><li q= "02" id="[0,2]"></li><li q= "12" id="[1,2]"></li><li q= "22" id="[2,2]"></li></div>
                      </div>`);

    this.root.append(boardHTML);
    
  }
}

module.exports = View;
