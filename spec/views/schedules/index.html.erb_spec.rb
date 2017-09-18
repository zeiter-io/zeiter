require 'rails_helper'

RSpec.describe "schedules/index", type: :view do
  before(:each) do
    assign(:schedules, [
      Schedule.create!(
        :name => "Name",
        :special_code => "Special Code"
      ),
      Schedule.create!(
        :name => "Name",
        :special_code => "Special Code"
      )
    ])
  end

  it "renders a list of schedules" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Special Code".to_s, :count => 2
  end
end
