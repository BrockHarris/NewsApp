class SessionsController < ApplicationController
	def create
    user = User.authenticate(params[:login], params[:password])
    if user
      session[:user_id] = user.id
    else
      flash[:error] = "There was a problem with your username or password."
    end
    redirect_to root_url
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You've been signed out."
    redirect_to root_url
  end
end
