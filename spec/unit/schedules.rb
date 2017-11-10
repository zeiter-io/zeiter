RSpec.describe Schedule, :type => :controller do
  controller do
    def index
      render :json => {}, :status => 200
    end
  end

  describe "GET #index" do
    it "returns a 200 status code" do
      get :index
      expect(response).to have_http_status(200)
    end
  end
end