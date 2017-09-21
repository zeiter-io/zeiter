require 'rails_helper'

RSpec.describe "schedules_users/edit", type: :view do
  before(:each) do
    @schedules_user = assign(:schedules_user, SchedulesUser.create!())
  end

  it "renders the edit schedules_user form" do
    render

    assert_select "form[action=?][method=?]", schedules_user_path(@schedules_user), "post" do
    end
  end
end
