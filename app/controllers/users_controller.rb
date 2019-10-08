class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)
    if @user.save
      flash[:success] = 'New user registered'
      redirect_to root_url
    else
      flash[:danger] = 'User registration failed'
      render "new"
    end
  end

  private
  def users_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end
end
