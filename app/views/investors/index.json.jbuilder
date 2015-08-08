json.array!(@investors) do |investor|
  json.extract! investor, :id, :company_id, :title, :linked_in, :fax, :price_from, :price_to, :verified, :principal, :subscribed, :user_id, :phone, :phone_2
  json.url investor_url(investor, format: :json)
end
