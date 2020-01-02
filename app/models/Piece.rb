class Piece
  belongs_to :game
  attr_reader :type
  TYPES = [
    # Pieces white side
    :white_rook,
    :white_knight,
    :white_bishop,
    :white_king,
    :white_queen,
    :white_pawn,
    :black_rook,
    :black_knight,
    :black_bishop,
    :black_king,
    :black_queen,
    :black_pawn
  ]
  TYPES_TO_AL = [
    'R',
    'N',
    'B',
    'K',
    'Q',
    'P'
  ]
  def initialize(t) 
    @type = Piece::TYPES.index(t)
  end
  def self.getTypeMapForJS()
      Piece::TYPES
  end
  def getTypeSym
    return Piece::TYPES[@type]
  end
  def getTypeAl
    ind = @type
    if ind > Piece::TYPES_TO_AL.length - 1
      ind -= Piece::TYPES_TO_AL.length
    end
    return Piece::TYPES_TO_AL[ind]
  end

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
