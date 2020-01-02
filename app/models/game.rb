class Game < ApplicationRecord
  has_many :pieces

  belongs_to :user_id_white, class_name: 'User', foreign_key: 'user_id_white'
  belongs_to :user_id_black, class_name: 'User', foreign_key: 'user_id_black'
  
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
