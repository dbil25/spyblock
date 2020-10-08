class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.integer :player_count
      t.boolean :started

      t.timestamps
    end
  end
end
