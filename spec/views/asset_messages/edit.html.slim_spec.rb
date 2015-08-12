require 'rails_helper'

RSpec.describe "asset_messages/edit", type: :view do
  before(:each) do
    @asset_message = assign(:asset_message, AssetMessage.create!(
      :asset_id => 1,
      :sender_is_client => false,
      :content => "MyText"
    ))
  end

  it "renders the edit asset_message form" do
    render

    assert_select "form[action=?][method=?]", asset_message_path(@asset_message), "post" do

      assert_select "input#asset_message_asset_id[name=?]", "asset_message[asset_id]"

      assert_select "input#asset_message_sender_is_client[name=?]", "asset_message[sender_is_client]"

      assert_select "textarea#asset_message_content[name=?]", "asset_message[content]"
    end
  end
end
