class SessionsController < ApplicationController
  def create
    omniauth = request.env["omniauth.auth"]
    logger.debug omniauth.to_yaml #DEBUG
    user = User.find_by_provider_and_uid(omniauth['provider'], omniauth['uid']) || 
      User.create_with_omniauth(omniauth)
    session[:user_id] = user.id
    redirect_to root_url, :notice => "Signed in!"
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out"  
  end
end
