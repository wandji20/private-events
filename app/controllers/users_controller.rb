class UsersController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = 'user successfully created'
      redirect_to root_path
    else
      flash[:error] = 'Something went wrong'
      render 'new'
    end
  end

  def show
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:username, :userid, :email)
  end
end
