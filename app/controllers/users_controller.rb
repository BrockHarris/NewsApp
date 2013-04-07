class UsersController < ApplicationController
	def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Thanks for signing up!"
      redirect_to root_url
    else
    	flash[:notice] = "Please fill out the entire form."
      redirect_to (:back)
  end
  
  def show
  end
end
