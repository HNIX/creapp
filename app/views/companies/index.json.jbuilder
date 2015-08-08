json.array!(@companies) do |company|
  json.extract! company, :id, :name, :url, :stock_symbol, :description
  json.url company_url(company, format: :json)
end
