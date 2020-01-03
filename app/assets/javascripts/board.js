
/*

0  = img_tag 'white_rook.PNG'
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

// let board = [
//   [6,7,8,9,10,8,7,6],
//   [11,11,11,11,11,11,11,11],
//   [-1,-1,-1,-1,-1,-1,-1,-1],
//   [-1,-1,-1,-1,-1,-1,-1,-1],
//   [-1,-1,-1,-1,-1,-1,-1,-1],
//   [-1,-1,-1,-1,-1,-1,-1,-1],
//   [5,5,5,5,5,5,5,5],
//   [0,1,2,4,3,2,1,0],
// ];
window.DRAG_SOURCE = null;
window.DRAGGING = false;
window.DRAGGED = null;
window.DOFF = 25;
function create_chess_board(root,game_id,board) {
  return function ( ) {
    if ( window.DRAGGING ) {
      return;
    }
    //console.log('game_id', game_id)
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
        div.attr('data-x',j)
        div.attr('data-y',i);
        if ( is_black(i,j) ) 
          div.addClass('chess-square-black');
        root.append(div)
        if ( board[i][j] !== -1) {
          var pname = window.TYPES[board[i][j]];
          var base = "/assets/images";
          var img = $('<img class="chess-piece" />');
          img.attr('data-x',j)
          img.attr('data-y',i);
          img.attr('data-pname',pname);
          img.attr('data-id',board[i][j]);
          img.addClass(pname);
          img.attr('src',[base,pname + ".PNG"].join('/'));
          add_drag_drop_handlers(img);
          div.append(img);
        }
        $('body').unbind('update-chess-piece');
        $('body').on('update-chess-piece',function (e,i,j,id,oi,oj) {
            board[i][j] = id;
            board[oi][oj] = -1;
            let data = {
              si: oi,
              sj: oj,
              ei: i,
              ej: j,
              board: board
            };
            //above keeps track of start and end position, will use is_obstructed here. Return error
            //and rerender board with si and sj to reset invalid move 
            $.post('/games/id/verify',data,function (resp) {
              board = resp.board;
              $('body').trigger('chess-render-board');
            });
        });
      }
    }
  }
}
function add_drag_drop_handlers(el) {
  el.on('mousedown', function (e) {
    console.log("cloning element");
    var cl = el.clone();
    cl.css({'position': 'absolute'});
    cl.css({ 'left': e.pageX - window.DOFF, top: e.pageY - window.DOFF});
    cl.css({width: el.width(),height: el.height()});
    $('body').append(cl);
    el.hide();
    window.DRAG_SOURCE = el;
    window.DRAGGED = cl;
    window.DRAGGING = true;
  });
}
function onMouseUp(e) {
  console.log('mouseup fired early');
  if ( window.DRAGGING ) {
    console.log("looking for collision")
    window.DRAGGING = false;
    $('div.chess-square').each(function(i,el) {
      if ( !window.DRAGGED ) 
        return;
      el = $(el);
      var pos = el.position();
      var size = {w:el.width(),h:el.height()};
      var box = {
        x1: pos.left,
        y1: pos.top,
        x2: pos.left + size.w,
        y2: pos.top + size.h
      };
      console.log(box);
      if ( e.pageX > box.x1 && e.pageY > box.y1) {
        if ( e.pageX < box.x2 && e.pageY < box.y2 ) {
          console.log("We found a hit!");
          let odiv = window.DRAG_SOURCE.parent();
          odiv.html('');

          el.html(window.DRAG_SOURCE);
          window.DRAG_SOURCE.show();
          let i = el.attr('data-y');
          let j = el.attr('data-x');
          let oi = window.DRAG_SOURCE.attr('data-y');
          let oj = window.DRAG_SOURCE.attr('data-x');
          let id = window.DRAG_SOURCE.attr('data-id');
          window.DRAGGED.remove();
          window.DRAGGED = null;
          window.DRAG_SOURCE = null;
          $('body').trigger('update-chess-piece',[i,j,id,oi,oj]);
          $('body').trigger('chess-render-board');
        }
      }
    });
  }
}
$(function () {
  $(document).on('drag',function (e) {
    if ( window.DRAGGING ) {
      console.log("updating position",window.DRAGGED);
      window.DRAGGED.css({ 'left': e.pageX - window.DOFF, top: e.pageY - window.DOFF});
    }
  });
  $(document).on('dragend',onMouseUp);
});