class UsersController < ApplicationController
  #before_filter :check_access, only :edit

  def index
    @users  = User.search_by_name params['query'] if params['query']
    @users ||= User.all
  end # index

  def typeahead
    keyword = ActionController::Base.helpers.sanitize params['query']
    result  = User.search(keyword,
                          fields:       ['first_name', 'last_name'],
                          match:        :word_start,
                          limit:        10,
                          load:         false,
                          misspellings: { below: 5 }).collect {|r| "#{r.first_name} #{r.last_name}"}
    render json: result
  end

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