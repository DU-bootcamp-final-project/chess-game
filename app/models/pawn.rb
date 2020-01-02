class Pawn < Piece

def valid_move?(x_destination, y_destination)
  return false if is_obstructed([x_destination, y_destination])
  if [2,7].include?(cell_y)
   (cell_x - x_destination).abs == 0 && (cell_y - y_destination).abs <= 2
  else 
    (cell_x - x_destination).abs == 0 && (cell_y - y_destination).abs == 1

end


