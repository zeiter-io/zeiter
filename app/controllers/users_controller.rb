class UsersController < ApplicationController
  #before_filter :check_access, only :edit
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  private
    def user_params
      params.require(:user).permit(:email)
    end
end
