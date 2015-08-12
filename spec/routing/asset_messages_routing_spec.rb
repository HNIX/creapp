require "rails_helper"

RSpec.describe AssetMessagesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/asset_messages").to route_to("asset_messages#index")
    end

    it "routes to #new" do
      expect(:get => "/asset_messages/new").to route_to("asset_messages#new")
    end

    it "routes to #show" do
      expect(:get => "/asset_messages/1").to route_to("asset_messages#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/asset_messages/1/edit").to route_to("asset_messages#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/asset_messages").to route_to("asset_messages#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/asset_messages/1").to route_to("asset_messages#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/asset_messages/1").to route_to("asset_messages#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/asset_messages/1").to route_to("asset_messages#destroy", :id => "1")
    end

  end
end
