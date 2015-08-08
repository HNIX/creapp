json.array!(@campaigns) do |campaign|
  json.extract! campaign, :id, :client_id, :asset_id, :sent, :send_now, :send_on, :step_1_complete, :step_2_complete, :step_3_complete, :step_4_complete, :authorized
  json.url campaign_url(campaign, format: :json)
end
