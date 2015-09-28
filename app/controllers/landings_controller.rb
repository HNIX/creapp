class LandingsController < ApplicationController
  layout "empty"
  def main
    if current_user.present? && current_user.client.present?
      @asset_listings = current_user.client.asset_listings?
    end
    super
  end
end
