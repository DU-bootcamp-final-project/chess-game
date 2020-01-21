class Knight < Piece

  def valid_move?(destination_x, destination_y)
    delta_x = (cell_x - destination_x).abs 
    delta_y = (cell_y - destination_y).abs 

    (delta_x == 2 && delta_y == 1) || (delta_x == 1 && delta_y == 2)
  end 

end