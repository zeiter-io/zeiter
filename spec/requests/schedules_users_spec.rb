require 'rails_helper'

RSpec.describe "SchedulesUsers", type: :request do
  describe "GET /schedules_users" do
    it "works! (now write some real specs)" do
      get schedules_users_path
      expect(response).to have_http_status(200)
    end
  end
end
