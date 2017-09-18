require 'rails_helper'

RSpec.describe "schedules/new", type: :view do
  before(:each) do
    assign(:schedule, Schedule.new(
      :name => "MyString",
      :special_code => "MyString"
    ))
  end

  it "renders new schedule form" do
    render

    assert_select "form[action=?][method=?]", schedules_path, "post" do

      assert_select "input[name=?]", "schedule[name]"

      assert_select "input[name=?]", "schedule[special_code]"
    end
  end
end
