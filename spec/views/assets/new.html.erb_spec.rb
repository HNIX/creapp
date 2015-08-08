require 'rails_helper'

RSpec.describe "assets/new", type: :view do
  before(:each) do
    assign(:asset, Asset.new(
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

  it "renders new asset form" do
    render

    assert_select "form[action=?][method=?]", assets_path, "post" do

      assert_select "input#asset_client_id[name=?]", "asset[client_id]"

      assert_select "input#asset_name[name=?]", "asset[name]"

      assert_select "textarea#asset_description[name=?]", "asset[description]"

      assert_select "input#asset_size[name=?]", "asset[size]"

      assert_select "input#asset_land_size[name=?]", "asset[land_size]"

      assert_select "input#asset_price[name=?]", "asset[price]"

      assert_select "input#asset_price_psf[name=?]", "asset[price_psf]"

      assert_select "input#asset_hide_price[name=?]", "asset[hide_price]"

      assert_select "input#asset_cap_rate[name=?]", "asset[cap_rate]"

      assert_select "input#asset_occupancy[name=?]", "asset[occupancy]"

      assert_select "textarea#asset_highlights[name=?]", "asset[highlights]"

      assert_select "input#asset_year_built[name=?]", "asset[year_built]"
    end
  end
end
