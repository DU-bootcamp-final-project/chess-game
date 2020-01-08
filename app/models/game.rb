class Game < ApplicationRecord
  has_many :pieces

  belongs_to :user_id_white, class_name: 'User', foreign_key: 'user_id_white'
  belongs_to :user_id_black, class_name: 'User', foreign_key: 'user_id_black'
  
  def getBoardObject
    return [
      [6,7,8,9,10,8,7,6],
      [11,11,11,11,11,11,11,11],
      [-1,-1,-1,-1,-1,-1,-1,-1],
      [-1,-1,-1,-1,-1,-1,-1,-1],
      [-1,-1,-1,-1,-1,-1,-1,-1],
      [-1,-1,-1,-1,-1,-1,-1,-1],
      [5,5,5,5,5,5,5,5],
      [0,1,2,4,3,2,1,0],
    ]
  end

def check(user_id_white, user_id_black)
  # checked_king = piece.find_by(type: 'King')
  # opponent_pieces = piece.find_by(user_id_white, captured: false)
  #need to check for oppnents and irrate through remaining pieces to see if they can capture King? or check to see if king still has a valid move?

end
