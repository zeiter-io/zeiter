require 'rails_helper'

RSpec.describe "schedules_users/show", type: :view do
  before(:each) do
    @schedules_user = assign(:schedules_user, SchedulesUser.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
