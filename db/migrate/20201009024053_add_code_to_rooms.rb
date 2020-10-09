class AddCodeToRooms < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms, :code, :string, null: false
    add_index :rooms, :code
  end
end
