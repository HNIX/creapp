require 'rails_helper'

RSpec.describe "asset_messages/index", type: :view do
  before(:each) do
    assign(:asset_messages, [
      AssetMessage.create!(
        :asset_id => 1,
        :sender_is_client => false,
        :content => "MyText"
      ),
      AssetMessage.create!(
        :asset_id => 1,
        :sender_is_client => false,
        :content => "MyText"
      )
    ])
  end

  it "renders a list of asset_messages" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
