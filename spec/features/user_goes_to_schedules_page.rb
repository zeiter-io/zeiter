#check https://relishapp.com/rspec/rspec-rails/docs/ for spec style guidelines
=begin
RSpec.describe User, :type => :controller do
  feature 'visits the Schedules link and' do
    context 'when logged in' do
      user = FactoryBot.create :user      
      scenario 'they see all Schedules on the page' do
        get schedules_path
        expect(response).to have_http_status(200)      
      end
    end
    context 'when not logged in' do
      scenario 'they get an error' do
        visit schedules_path
        is_expected.to respond_with 400
      end
    end
  end
end
=end