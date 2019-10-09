class UsersController < ApplicationController

  def index
    @users = User.paginate(page: params[:page], per_page: 10)
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(users_params)
    if @user.save
      flash[:success] = 'New user registered'
      redirect_to root_url(@user)
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
