require 'rails_helper'

RSpec.describe "campaigns/edit", type: :view do
  before(:each) do
    @campaign = assign(:campaign, Campaign.create!(
      :client => nil,
      :asset => nil,
      :sent => false,
      :send_now => false,
      :step_1_complete => false,
      :step_2_complete => false,
      :step_3_complete => false,
      :step_4_complete => false,
      :authorized => false
    ))
  end

  it "renders the edit campaign form" do
    render

    assert_select "form[action=?][method=?]", campaign_path(@campaign), "post" do

      assert_select "input#campaign_client_id[name=?]", "campaign[client_id]"

      assert_select "input#campaign_asset_id[name=?]", "campaign[asset_id]"

      assert_select "input#campaign_sent[name=?]", "campaign[sent]"

      assert_select "input#campaign_send_now[name=?]", "campaign[send_now]"

      assert_select "input#campaign_step_1_complete[name=?]", "campaign[step_1_complete]"

      assert_select "input#campaign_step_2_complete[name=?]", "campaign[step_2_complete]"

      assert_select "input#campaign_step_3_complete[name=?]", "campaign[step_3_complete]"

      assert_select "input#campaign_step_4_complete[name=?]", "campaign[step_4_complete]"

      assert_select "input#campaign_authorized[name=?]", "campaign[authorized]"
    end
  end
end
