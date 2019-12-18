
/*

0 white_rook
1 white_knight
2 white_bishop
3 white_king
4 white_queen
5 white_pawn
6 black_rook
7 black_knight
8 black_bishop
9 black_king
10 black_queen
11 black_pawn

*/
let board = [
  [0,1,2,4,3,2,1,0],
  [5,5,5,5,5,5,5,5],
  [-1,-1,-1,-1,-1,-1,-1,-1],
  [-1,-1,-1,-1,-1,-1,-1,-1],
  [-1,-1,-1,-1,-1,-1,-1,-1],
  [-1,-1,-1,-1,-1,-1,-1,-1],
  [5,5,5,5,5,5,5,5],
  [0,1,2,3,4,2,1,0]
];

function create_chess_board(root,game_id) {
  console.log('game_id', game_id)
  function is_black(i,j) {
    if ( i % 2 == 0 ) {
      return j % 2 == 0 ? false : true;
    } else {
      return j % 2 == 0 ? true : false;
    }
  }
  root.html('');
  let width = root.attr('data-width');
  let black_color = root.attr('data-black');
  root.css({'width':parseInt(width)+2});
  let alpha = 'ABCDEFGH';
  for ( let i = 0; i < 8; i ++ ) {
    for ( let j = 0; j < 8; j++ ) {
      let div = $('<div class="chess-square"></div>');
      div.css({'width': width / 8,'height': width / 8});
      if ( is_black(i,j) ) 
        div.addClass('chess-square-black');
      root.append(div)
      //div.html(alpha[j]+ (9- (i+1)))
      if ( board[i][j] !== -1)
        div.append(board[i][j]);
    }
  }
}