class UsersController < ApplicationController
  
  def new
    render '/users/new.html.erb'
  end

  #creates a new user
  def create
    new_user = User.new(create_params)
    new_user.save
    redirect_to home_new_url
  end

  
  def destroy
    if session[:user_id]
      User.find(session[:user_id]).delete
    end
  end

  private
  def create_params
    checked_params = params.permit(:username, :email, :password, :confirmed_password)
    checked_params[:email] = checked_params[:email].downcase
    checked_params[:games_won] = 0
    checked_params
  end

end
