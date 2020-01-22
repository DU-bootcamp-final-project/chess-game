class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.timestamps
    end
    add_reference :games, :user_id_black, foreign_key: { to_table: :users }
    add_reference :games, :user_id_white, foreign_key: { to_table: :users }
  end
end
