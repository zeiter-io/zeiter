RSpec.describe EnrollmentsHelper, type: :helper do  
  feature 'User looks at all Schedules' do
    scenario 'they see all Schedules on the page' do
      visit schedules_path
    end
  end
end