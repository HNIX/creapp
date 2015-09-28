module LandingsHelper
  def total_asset_value
    @asset_listings.sum(:price)
  end
  def average_listing_price
    @asset_listings.average(:price)
  end

  def total_active
    @asset_listings.where(ended: false).count #total active listings
  end

  def total_ended
    @asset_listings.where(ended: false).count #total active listings
  end

end
