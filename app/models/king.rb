class King < Piece

  def valid_move?(x_destination, y_destination)
    return false unless (cell_x - x_destination).abs <= 1 && (cell_y - y_destination).abs <= 1  

    found_piece = Piece.find_by(cell_x: x_destination, cell_y: y_destination, game_id: game_id)
    (found_piece.nil? || found_piece.color != color) 
  end

end