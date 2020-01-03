class King < Piece

  def valid_move?(x_destination, y_destination)
    return false unless is_obstructed?([x_destination, y_destination])

    (cell_x - x_destination).abs <= 1 && (cell_y - y_destination).abs <= 1  

  end

end