require 'rails_helper'

RSpec.describe "shifts/index", type: :view do
  before(:each) do
    assign(:shifts, [
      Shift.create!(
        :name => "Name",
        :duration => "9.99",
        :repeat => false,
        :repeat_every => 2,
        :repeat_every_unit => "Repeat Every Unit"
      ),
      Shift.create!(
        :name => "Name",
        :duration => "9.99",
        :repeat => false,
        :repeat_every => 2,
        :repeat_every_unit => "Repeat Every Unit"
      )
    ])
  end

  it "renders a list of shifts" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Repeat Every Unit".to_s, :count => 2
  end
end
