json.array!(@locations) do |location|
  json.extract! location, :id, :address, :longitude, :latitude, :user_id, :company_id, :asset_id
  json.url location_url(location, format: :json)
end
