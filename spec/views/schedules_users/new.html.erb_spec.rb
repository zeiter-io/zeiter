require 'rails_helper'

RSpec.describe "schedules_users/new", type: :view do
  before(:each) do
    assign(:schedules_user, SchedulesUser.new())
  end

  it "renders new schedules_user form" do
    render

    assert_select "form[action=?][method=?]", schedules_users_path, "post" do
    end
  end
end
