class King < Piece

  def valid_move?(x_destination, y_destination)
    x_distance = (cell_x - x_destination).abs <= 1 
    y_distance = (cell_y - y_destination).abs <= 1

  end

end