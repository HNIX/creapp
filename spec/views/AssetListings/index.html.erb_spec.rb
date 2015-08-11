require 'rails_helper'

RSpec.describe "AssetListings/index", type: :view do
  before(:each) do
    assign(:asset_listings, [
      AssetListing.create!(
        :client => nil,
        :name => "Name",
        :description => "MyText",
        :size => 1,
        :land_size => 2,
        :price => 1.5,
        :price_psf => 1.5,
        :hide_price => false,
        :cap_rate => 1.5,
        :occupancy => 1.5,
        :highlights => "MyText",
        :year_built => "Year Built"
      ),
      AssetListing.create!(
        :client => nil,
        :name => "Name",
        :description => "MyText",
        :size => 1,
        :land_size => 2,
        :price => 1.5,
        :price_psf => 1.5,
        :hide_price => false,
        :cap_rate => 1.5,
        :occupancy => 1.5,
        :highlights => "MyText",
        :year_built => "Year Built"
      )
    ])
  end

  it "renders a list of AssetListings" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Year Built".to_s, :count => 2
  end
end
