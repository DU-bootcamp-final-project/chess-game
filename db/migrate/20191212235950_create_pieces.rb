class CreatePieces < ActiveRecord::Migration[5.2]
  def change
    create_table :pieces do |t|
      t.string :piece_type
      t.integer :cell_x
      t.integer :cell_y
      t.integer :user_id
      t.integer :game_id
      t.timestamps
    end
  end
end
