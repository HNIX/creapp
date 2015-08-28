module LandingsHelper
  def total_asset_value
    @asset_listings.sum(:price)
  end
  def average_listing_price
    @asset_listings.average(:price)
  end
end
