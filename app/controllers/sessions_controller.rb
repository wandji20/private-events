class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by_userid(params[:userid]) || User.find_by_username(params[:username])
    if user
      session[:user_id] = user.id
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path flash[:success] = 'You have succesfully logged out'
  end
end
