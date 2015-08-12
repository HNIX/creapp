class AssetFromApplication < Asset
  has_one :asset_listing

  validates :asset_listing_id, presence: true
  #validates :rate_type, inclusion: { in: ['hourly', 'fixed_price'], message: 'must be selected' }
  #validates :hourly_rate, presence: true, if: :hourly?
  #validates :fixed_rate, presence: true, if: :fixed_price?
end
