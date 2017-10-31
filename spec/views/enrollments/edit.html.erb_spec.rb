require 'rails_helper'

RSpec.describe "enrollments/edit", type: :view do
  before(:each) do
    @enrollment = assign(:enrollment, Enrollment.create!())
  end

  it "renders the edit enrollment form" do
    render

    assert_select "form[action=?][method=?]", enrollment_path(@enrollment), "post" do
    end
  end
end
