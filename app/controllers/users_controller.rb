class UsersController < ApplicationController
 before_action :set_user, only: [:edit, :update, :destroy, :show]

 def edit
 end
 
 def update #追加（更新処理）
    if @user.update(user_params)
      # 保存に成功した場合はトップページへリダイレクト
      redirect_to root_path , notice: 'ユーザー情報を更新しました'
      render 'show'
    else
      # 保存に失敗した場合は編集画面へ戻す
      render 'edit' , notice: 'ユーザー情報の更新に失敗しました'
    end
 end

  def show # 追加
   @user = User.find(params[:id])
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

  private

  def user_params
    params.require(:user).permit(:name, :email, :sex, :email, :profile, :password, 
                                 :password_confirmation)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
end