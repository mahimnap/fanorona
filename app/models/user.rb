class User < ApplicationRecord
    self.primary_key = "user_id"
    validates_confirmation_of :password
    validates_presence_of :username, :email, :games_won
    has_secure_password
end
