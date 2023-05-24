class CreateBoards < ActiveRecord::Migration[6.1]
  def change
    create_table :boards, :primary_key => :board_id do |t|
      t.integer :rows
      t.integer :columns

      t.timestamps
    end
  end
end
