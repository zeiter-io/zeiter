class UsersController < ApplicationController
  def index
    @users = User.search_by_name(params['search'])
    @users ||= User.all
  end # index

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  private
    def user_params
      params.require(:user).permit(:email, :first_name, :middle_name, :last_name)
    end
end