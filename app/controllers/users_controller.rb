class UsersController < ApplicationController
  def show # 追加
   @user = User.find(params[:id])
   @microposts = @user.microposts.order(created_at: :desc)
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!" # 追加
      redirect_to @user # ここを修正
    else
      render 'new'
    end
  end
  
  def followings#追加
      @user  = User.find(params[:id])
      @users = @user.following
      render 'show_follow'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :followers, :followings, :password,
                                 :password_confirmation)
  end
end