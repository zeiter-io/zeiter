class UsersController < ApplicationController
  #before_filter :check_access, only :edit

  def index
    @users = User.all
  end # index

  def show
    @user = User.find(params[:id])
    @shifts = @user.shifts
  end

  def edit
  end

  def edit
  end

  private
    def user_params
      params.require(:user).permit(:email, :first_name, :middle_name, :last_name, :query)
    end
end