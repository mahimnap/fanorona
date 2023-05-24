class CreateMatches < ActiveRecord::Migration[6.1]
  def change
    create_table :matches, :primary_key => :match_id do |t|
      t.integer :white_player
      t.integer :black_player
      t.integer :board_id
      t.integer :current_player
      t.boolean :match_started
      t.integer :winning_colour

      t.timestamps
    end
  end
end
