class AddColorToPlayers < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :color, :string, null: false
  end
end
