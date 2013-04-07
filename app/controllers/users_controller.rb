class UsersController < ApplicationController
	
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Thanks for signing up!"
      sign_user_in(@user)
      redirect_to root_url
    else
    	flash[:notice] = "Please fill out the entire form."
      redirect_to (:back)
    end
  end
  
  def show
  end
end
