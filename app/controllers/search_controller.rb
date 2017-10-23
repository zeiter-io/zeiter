class SearchController < ApplicationController

  def typeahead
    keyword = ActionController::Base.helpers.sanitize params['query']

    user_results = User.search(keyword,
                               fields: ['first_name', 'last_name'],
                               match: :word_start,
                               limit: 10,
                               load: false,
                               misspellings: {below: 5}).collect {|r| "#{r.first_name} #{r.last_name}"}

    schedule_results = Schedule.search(keyword,
                                       fields: ['name'],
                                       match: :word_start,
                                       limit: 10,
                                       load: false,
                                       misspellings: {below: 5}).collect {|r| "#{r.name}"}

    shift_results = Shift.search(keyword,
                                 fields: ['name'],
                                 match: :word_start,
                                 limit: 10,
                                 load: false,
                                 misspellings: {below: 5}).collect {|r| "#{r.name}"}

    result = user_results + schedule_results + shift_results

    render json: result
  end

  private
  def user_params
    params.require(:search).permit(:query)
  end

end # SearchController
