require 'rails_helper'

RSpec.describe "shifts/show", type: :view do
  before(:each) do
    @shift = assign(:shift, Shift.create!(
      :name => "Name",
      :duration => "9.99",
      :repeat => false,
      :repeat_every => 2,
      :repeat_every_unit => "Repeat Every Unit"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Repeat Every Unit/)
  end
end
