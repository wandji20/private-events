class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'user successfully created'
      redirect_to root_path
    else
      flash[:error] = 'Something went wrong'
      render 'new'
    end
  end

  def show
    @user = User.find(:id)
  end

  private

  def user_params
    params.require(:user).permit(:username, :userid, :email)
  end
end
