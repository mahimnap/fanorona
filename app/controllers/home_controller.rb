class HomeController < ApplicationController
  def new
  end

  def show
    user = User.find(session[:user_id])
    @username = user.username
    @email = user.email
  end
end