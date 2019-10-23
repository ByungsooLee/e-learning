class UsersController < ApplicationController

  def index
    @users = User.paginate(page: params[:page], per_page: 5)
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

  def edit
    @user = User.find(params[:id])
    # 編集するデータを探してくる
  end

  def update
    @user = User.find(params[:id])
    if @user.update(users_params)
      redirect_to current_user
    else
      render 'edit'
    end
  end

  def following
    @user = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page], per_page: 5)
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page], per_page: 5)
  end


  private
  def users_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation, :picture)
  end

end
