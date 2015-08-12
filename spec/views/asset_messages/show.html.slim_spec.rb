require 'rails_helper'

RSpec.describe "asset_messages/show", type: :view do
  before(:each) do
    @asset_message = assign(:asset_message, AssetMessage.create!(
      :asset_id => 1,
      :sender_is_client => false,
      :content => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/MyText/)
  end
end
