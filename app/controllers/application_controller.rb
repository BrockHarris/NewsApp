class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def sign_user_in(user)
    session[:user_id] = user.id
    redirect_to root_url
  end
end
