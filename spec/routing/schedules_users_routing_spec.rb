require "rails_helper"

RSpec.describe SchedulesUsersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/schedules_users").to route_to("schedules_users#index")
    end

    it "routes to #new" do
      expect(:get => "/schedules_users/new").to route_to("schedules_users#new")
    end

    it "routes to #show" do
      expect(:get => "/schedules_users/1").to route_to("schedules_users#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/schedules_users/1/edit").to route_to("schedules_users#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/schedules_users").to route_to("schedules_users#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/schedules_users/1").to route_to("schedules_users#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/schedules_users/1").to route_to("schedules_users#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/schedules_users/1").to route_to("schedules_users#destroy", :id => "1")
    end

  end
end
