class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]
  def show
   @user = User.find(params[:id])
   @microposts = @user.microposts
  end
  
  def new
        @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
      render 'edit'
  end
  
 def update
    if @user.update(user_params)
      # 保存に成功した場合はトップページへリダイレクト
      redirect_to current_user, notice: 'プロフィールを編集しました'
    else
      # 保存に失敗した場合は編集画面へ戻す
      render 'edit'
    end
 end


def followings
    @user = User.find(params[:id])
    @followings = @user.following_users

end

def followers
   @user = User.find(params[:id])
   @followers = @user.follower_users

end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :location,
                                 :description, :birthdate, :birthmonth, :birthday, :birthyear )
  end
  def set_user
    @user = User.find(params[:id])
  end
end
