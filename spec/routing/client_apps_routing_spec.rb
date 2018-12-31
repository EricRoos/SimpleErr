require "rails_helper"

RSpec.describe ClientAppsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/client_apps").to route_to("client_apps#index")
    end

    it "routes to #new" do
      expect(:get => "/client_apps/new").to route_to("client_apps#new")
    end

    it "routes to #show" do
      expect(:get => "/client_apps/1").to route_to("client_apps#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/client_apps/1/edit").to route_to("client_apps#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/client_apps").to route_to("client_apps#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/client_apps/1").to route_to("client_apps#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/client_apps/1").to route_to("client_apps#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/client_apps/1").to route_to("client_apps#destroy", :id => "1")
    end
  end
end
