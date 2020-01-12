class Rook < Piece

    def valid_move?(x_destination, y_destination)
        ((cell_x - x_destination).abs >= 1 && cell_x - x_destination).abs <= 8) && 
        (cell_y - y_destination).zero? && 
        is_obstructed?([x_destination, y_destination]) ||
        ((cell_y - y_destination).abs >= 1 && cell_y - y_destination).abs <= 8) && 
        (cell_x - x_destination).zero? && 
        is_obstructed?([x_destination, y_destination])
    end    

end