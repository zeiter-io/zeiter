require 'rails_helper'

RSpec.describe "enrollments/show", type: :view do
  before(:each) do
    @enrollment = assign(:enrollment, Enrollment.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
