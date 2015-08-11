require 'rails_helper'

RSpec.describe "asset_listings/edit", type: :view do
  before(:each) do
    asset_listing = assign(:asset_listing, AssetListing.create!(
      :client => nil,
      :name => "MyString",
      :description => "MyText",
      :size => 1,
      :land_size => 1,
      :price => 1.5,
      :price_psf => 1.5,
      :hide_price => false,
      :cap_rate => 1.5,
      :occupancy => 1.5,
      :highlights => "MyText",
      :year_built => "MyString"
    ))
  end

  it "renders the edit asset_listing form" do
    render

    assert_select "form[action=?][method=?]", asset_path(asset_listing), "post" do

      assert_select "input#asset_client_id[name=?]", "asset_listing[client_id]"

      assert_select "input#asset_name[name=?]", "asset_listing[name]"

      assert_select "textarea#asset_description[name=?]", "asset_listing[description]"

      assert_select "input#asset_size[name=?]", "asset_listing[size]"

      assert_select "input#asset_land_size[name=?]", "asset_listing[land_size]"

      assert_select "input#asset_price[name=?]", "asset_listing[price]"

      assert_select "input#asset_price_psf[name=?]", "asset_listing[price_psf]"

      assert_select "input#asset_hide_price[name=?]", "asset_listing[hide_price]"

      assert_select "input#asset_cap_rate[name=?]", "asset_listing[cap_rate]"

      assert_select "input#asset_occupancy[name=?]", "asset_listing[occupancy]"

      assert_select "textarea#asset_highlights[name=?]", "asset_listing[highlights]"

      assert_select "input#asset_year_built[name=?]", "asset_listing[year_built]"
    end
  end
end
