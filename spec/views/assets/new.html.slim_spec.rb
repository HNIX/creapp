require 'rails_helper'

RSpec.describe "assets/new", type: :view do
  before(:each) do
    assign(:asset, Asset.new(
      :investor_id => 1,
      :client_id => 1,
      :state => "MyString",
      :name => "MyString",
      :price => 1,
      :asset_listing_id => 1,
      :type => ""
    ))
  end

  it "renders new asset form" do
    render

    assert_select "form[action=?][method=?]", assets_path, "post" do

      assert_select "input#asset_investor_id[name=?]", "asset[investor_id]"

      assert_select "input#asset_client_id[name=?]", "asset[client_id]"

      assert_select "input#asset_state[name=?]", "asset[state]"

      assert_select "input#asset_name[name=?]", "asset[name]"

      assert_select "input#asset_price[name=?]", "asset[price]"

      assert_select "input#asset_asset_listing_id[name=?]", "asset[asset_listing_id]"

      assert_select "input#asset_type[name=?]", "asset[type]"
    end
  end
end
