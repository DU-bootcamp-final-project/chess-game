class Bishop < Piece

def valid_move?(x_destination, y_destination)
  ((cell_y - y_destination) / (cell_x - x_destination)).abs == 1 && 
  (cell_y - y_destination).abs <= 7 && 
  (cell_x - x_destination).abs <= 7 && 
  is_obstructed([x_destination, y_destination])
end

end