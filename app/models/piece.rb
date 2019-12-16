class Piece < ApplicationRecord
  belongs_to :game


  def is_obstructed?(destination)

    x1 = cell_x #lets us know where the piece starts
    y1 = cell_y
    x2 = destination.first 
    y2 = destination.last
    del_x = (x2 - x1).positive? ? 1 : -1
    del_y = (y2 - y1).positive? ? 1 : -1
    dest_x = x2 - del_x 
    dest_y = y2 - del_y 


    while x1 != dest_x && y1 != dest_y 
      x1 = del_x + x1 unless x1 == dest_x
      y1 = del_y + y1 unless y1 == dest_y
      return true if Piece.find_by(cell_x: x1, cell_y: y1, game_id: game_id).present?
    end

    return false 

  end

end 
