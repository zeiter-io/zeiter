require 'rails_helper'

RSpec.describe "shifts/edit", type: :view do
  before(:each) do
    @shift = assign(:shift, Shift.create!(
      :name => "MyString",
      :duration => "9.99",
      :repeat => false,
      :repeat_every => 1,
      :repeat_every_unit => "MyString"
    ))
  end

  it "renders the edit shift form" do
    render

    assert_select "form[action=?][method=?]", shift_path(@shift), "post" do

      assert_select "input[name=?]", "shift[name]"

      assert_select "input[name=?]", "shift[duration]"

      assert_select "input[name=?]", "shift[repeat]"

      assert_select "input[name=?]", "shift[repeat_every]"

      assert_select "input[name=?]", "shift[repeat_every_unit]"
    end
  end
end
