require 'rails_helper'

RSpec.describe "enrollments/index", type: :view do
  before(:each) do
    assign(:enrollments, [
      Enrollment.create!(),
      Enrollment.create!()
    ])
  end

  it "renders a list of enrollments" do
    render
  end
end
