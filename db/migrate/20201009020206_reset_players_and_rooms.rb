class ResetPlayersAndRooms < ActiveRecord::Migration[6.0]
  def change
    drop_table :rooms
    drop_table :players
    create_table :rooms, id: :uuid do |t|
      t.integer :player_count
      t.boolean :started

      t.timestamps
    end
    create_table :players, id: :uuid do |t|
      t.string :name
      t.uuid :room_id

      t.timestamps
    end
  end
end
