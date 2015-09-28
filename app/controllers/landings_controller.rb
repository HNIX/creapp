class LandingsController < ApplicationController
  layout "empty"
  def main
    if current_user.present?
      @asset_listings = current_user.asset_listings?
    end
    super
  end
end
