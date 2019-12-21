class Piece
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
end