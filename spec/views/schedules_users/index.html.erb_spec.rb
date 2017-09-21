require 'rails_helper'

RSpec.describe "schedules_users/index", type: :view do
  before(:each) do
    assign(:schedules_users, [
      SchedulesUser.create!(),
      SchedulesUser.create!()
    ])
  end

  it "renders a list of schedules_users" do
    render
  end
end
