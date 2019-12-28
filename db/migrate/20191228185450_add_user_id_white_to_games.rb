class AddUserIdWhiteToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :user_id_white, :integer
  end
end
