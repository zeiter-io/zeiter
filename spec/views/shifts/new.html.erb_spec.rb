require 'rails_helper'

RSpec.describe "shifts/new", type: :view do
  before(:each) do
    assign(:shift, Shift.new(
      :name => "MyString",
      :duration => "9.99",
      :repeat => false,
      :repeat_every => 1,
      :repeat_every_unit => "MyString"
    ))
  end

  it "renders new shift form" do
    render

    assert_select "form[action=?][method=?]", shifts_path, "post" do

      assert_select "input[name=?]", "shift[name]"

      assert_select "input[name=?]", "shift[duration]"

      assert_select "input[name=?]", "shift[repeat]"

      assert_select "input[name=?]", "shift[repeat_every]"

      assert_select "input[name=?]", "shift[repeat_every_unit]"
    end
  end
end
