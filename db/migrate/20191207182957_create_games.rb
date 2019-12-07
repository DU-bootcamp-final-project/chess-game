class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.integer :user_id
      t.integer :id
      t.timestamps
    end
    add_index :games, :user_id
  end
end
