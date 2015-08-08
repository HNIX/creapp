require 'rails_helper'

RSpec.describe "locations/edit", type: :view do
  before(:each) do
    @location = assign(:location, Location.create!(
      :address => "MyString",
      :longitude => 1.5,
      :latitude => 1.5,
      :user => nil,
      :company => nil,
      :asset => nil
    ))
  end

  it "renders the edit location form" do
    render

    assert_select "form[action=?][method=?]", location_path(@location), "post" do

      assert_select "input#location_address[name=?]", "location[address]"

      assert_select "input#location_longitude[name=?]", "location[longitude]"

      assert_select "input#location_latitude[name=?]", "location[latitude]"

      assert_select "input#location_user_id[name=?]", "location[user_id]"

      assert_select "input#location_company_id[name=?]", "location[company_id]"

      assert_select "input#location_asset_id[name=?]", "location[asset_id]"
    end
  end
end
