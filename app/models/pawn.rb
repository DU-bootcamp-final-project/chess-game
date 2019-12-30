class Pawn < Piece

def valid_move?(x_destination, y_destination, board)
  if [j] == 2 or [j] == 7 then (cell_x - x_destination).abs == 0 && (cell_y - y_destination).abs == 2
  else 
    (cell_x - x_destination).abs == 0 && (cell_y - y_destination).abs == 1 && is_obstructed([x_destination, y_destination])
end

end