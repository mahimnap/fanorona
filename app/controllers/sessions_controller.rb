class SessionsController < ApplicationController
  
  #authenticates user and
  def create
    signin_info = signin_params
    user = User.find_by(email: signin_info[:email])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to home_show_url
    else
      flash.now.alert = "Incorrect login! Try again..."
    end
  end
  
  def destroy
    session.clear
    redirect_to home_new_url
  end

  private
  # TODO: can we add private methods? 
  def signin_params
    params.require([:email, :password]) # throws if email and password missing
    checked = params.permit(:email, :password) # delete stuff that isn't email and password
    checked[:email].downcase!
    checked
  end

end
