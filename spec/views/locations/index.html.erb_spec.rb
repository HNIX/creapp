require 'rails_helper'

RSpec.describe "locations/index", type: :view do
  before(:each) do
    assign(:locations, [
      Location.create!(
        :address => "Address",
        :longitude => 1.5,
        :latitude => 1.5,
        :user => nil,
        :company => nil,
        :asset_listing => nil
      ),
      Location.create!(
        :address => "Address",
        :longitude => 1.5,
        :latitude => 1.5,
        :user => nil,
        :company => nil,
        :asset_listing => nil
      )
    ])
  end

  it "renders a list of locations" do
    render
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
