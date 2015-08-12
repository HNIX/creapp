json.array!(@asset_messages) do |asset_message|
  json.extract! asset_message, :id, :asset_id, :sender_is_client, :content
  json.url asset_message_url(asset_message, format: :json)
end
