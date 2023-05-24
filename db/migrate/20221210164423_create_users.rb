class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users, :primary_key => :user_id do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.integer :games_won

      t.timestamps
    end
  end
end
