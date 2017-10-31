require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  describe "GET Request to the Home Controller" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end