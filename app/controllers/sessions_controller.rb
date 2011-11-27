class SessionsController < ApplicationController
  def create
    user = login(params[:username], params[:password], params[:remember_me])
    logger.debug "User outuput: #{user}"
    if user
      redirect_to root_url, :notice => "Logged in as #{user.username}"
    else
      flash.now.alert = "Username or password was invalid"
      render :new
    end
  end
  
  def destroy
    logout
    redirect_to root_url, :notice => "Logged out"  
  end
end
