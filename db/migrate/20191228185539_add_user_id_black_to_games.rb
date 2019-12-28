class AddUserIdBlackToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :user_id_black, :integer
  end
end
