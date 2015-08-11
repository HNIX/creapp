require "rails_helper"

RSpec.describe AssetListingsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/AssetListings").to route_to("assets#index")
    end

    it "routes to #new" do
      expect(:get => "/AssetListings/new").to route_to("assets#new")
    end

    it "routes to #show" do
      expect(:get => "/AssetListings/1").to route_to("assets#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/AssetListings/1/edit").to route_to("assets#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/AssetListings").to route_to("assets#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/AssetListings/1").to route_to("assets#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/AssetListings/1").to route_to("assets#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/AssetListings/1").to route_to("assets#destroy", :id => "1")
    end

  end
end
