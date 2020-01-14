class Game < ApplicationRecord
  scope :available, -> { where(user_id_white: true) }
 
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
  
end