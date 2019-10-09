class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    # form_for sessionに入力されたemailの内容を元に、Userデータベースのカラムのデータを取得する。
   if @user && @user.authenticate(params[:session][:password])
    # ユーザーが存在して、passwordが一致しているかを確認するコード
    log_in(@user)
    flash[:success] = "Successfully logged in."
    redirect_to root_url(@user)
   else
    flash.now[:danger] = "Invalid Credential"
    render "new"
   end
 end
 
end
