json.array!(@clients) do |client|
  json.extract! client, :id, :user_id, :name, :subdomain, :url, :description
  json.url client_url(client, format: :json)
end
