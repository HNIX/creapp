require 'rails_helper'

RSpec.describe "locations/new", type: :view do
  before(:each) do
    assign(:location, Location.new(
      :address => "MyString",
      :longitude => 1.5,
      :latitude => 1.5,
      :user => nil,
      :company => nil,
      :asset => nil
    ))
  end

  it "renders new location form" do
    render

    assert_select "form[action=?][method=?]", locations_path, "post" do

      assert_select "input#location_address[name=?]", "location[address]"

      assert_select "input#location_longitude[name=?]", "location[longitude]"

      assert_select "input#location_latitude[name=?]", "location[latitude]"

      assert_select "input#location_user_id[name=?]", "location[user_id]"

      assert_select "input#location_company_id[name=?]", "location[company_id]"

      assert_select "input#location_asset_id[name=?]", "location[asset_id]"
    end
  end
end
