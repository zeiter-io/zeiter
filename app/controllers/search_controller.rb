class SearchController < ApplicationController

  def index
  end

  def all
    @user = User.search_by_name params[:query]
    @schedule = Schedule.search_by_name params[:query]
    @shift = Shift.search_by_name params[:query]
    render 'index'
  end

  def global
    keyword = ActionController::Base.helpers.sanitize params['query']

    user_results = User.search(keyword,
                               fields: ['first_name', 'last_name'],
                               match: :word_start,
                               limit: 10,
                               load: false,
                               misspellings: {below: 5}).records

    schedule_results = Schedule.search(keyword,
                                       fields: ['name'],
                                       match: :word_start,
                                       limit: 10,
                                       load: false,
                                       misspellings: {below: 5}).records

    shift_results = Shift.search(keyword,
                                 fields: ['name'],
                                 match: :word_start,
                                 limit: 10,
                                 load: false,
                                 misspellings: {below: 5}).records

    result = user_results + schedule_results + shift_results

    render json: result
  end

  private
  def user_params
    params.require(:search).permit(:query)
  end

end # SearchController
