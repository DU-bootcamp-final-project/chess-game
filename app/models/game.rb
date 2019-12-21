class Game < ApplicationRecord
  belongs_to :user
  def getBoardObject
    return [
      [0,1,2,4,3,2,1,0],
      [5,5,5,5,5,5,5,5],
      [-1,-1,-1,-1,-1,-1,-1,-1],
      [-1,-1,-1,-1,-1,-1,-1,-1],
      [-1,-1,-1,-1,-1,-1,-1,-1],
      [-1,-1,-1,-1,-1,-1,-1,-1],
      [5+6,5,5,5,5,5,5,5],
      [0,1,2,3,4,2,1,0]
    ]
  end
end
