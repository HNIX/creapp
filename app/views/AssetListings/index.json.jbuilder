json.array!(asset_listings) do |asset|
  json.extract! asset, :id, :client_id, :name, :description, :size, :land_size, :price, :price_psf, :hide_price, :cap_rate, :occupancy, :highlights, :year_built
  json.url asset_url(asset, format: :json)
end
