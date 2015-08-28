class LandingsController < ApplicationController
  layout "empty"
  def main
    @asset_listings = current_user.client.asset_listings
    super
  end
end