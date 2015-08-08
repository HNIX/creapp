json.array!(@tenants) do |tenant|
  json.extract! tenant, :id, :name, :size, :description, :asset_id
  json.url tenant_url(tenant, format: :json)
end
