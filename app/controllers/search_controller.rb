class SearchController < ApplicationController

  def index
  end

  def all
    @users = User.search_by_name params[:query]
    @shifts = Shift.search_by_name params[:query]

    # If exactly 1 result is returned, redirect to object#show
    # Else show all matched results. Blank search shows all.
    # User search has highest priority
    if @users.count == 1
      redirect_to @users.first
    elsif @shifts.count == 1
      redirect_to @shifts.first
    else
      render 'index'
    end
  end # def all

  def global
    keyword = ActionController::Base.helpers.sanitize params['query']

    user_results = User.search(keyword,
                               fields:       [:first_name],
                               match:        :text_start,
                               limit:        10,
                               misspellings: false,
                               load:         true).records

    shift_results = Shift.search(keyword,
                                 fields:       [:name],
                                 match:        :text_start,
                                 limit:        10,
                                 misspellings: false,
                                 load:         true).records

    result = user_results.map {|u| u.full_name} +
        # schedule_results.map { |sch| sch.name } +
        shift_results.map {|sh| sh.name}

    render json: result
  end # def global

  private
  def user_params
    params.require(:search).permit(:query)
  end

end # SearchController
