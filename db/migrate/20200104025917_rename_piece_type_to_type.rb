class RenamePieceTypeToType < ActiveRecord::Migration[5.2]
  def change
    rename_column :pieces, :piece_type, :type
    change_column :pieces, :type, :string, null: false 
  end
end
