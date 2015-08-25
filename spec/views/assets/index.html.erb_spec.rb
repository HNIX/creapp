require 'rails_helper'

RSpec.describe "assets/index", type: :view do
  before(:each) do
    assign(:assets, [
      Asset.create!(
        :investor_id => 1,
        :client_id => 2,
        :state => "State",
        :name => "Name",
        :price => 3,
        :asset_listing_id => 4,
        :type => "Type"
      ),
      Asset.create!(
        :investor_id => 1,
        :client_id => 2,
        :state => "State",
        :name => "Name",
        :price => 3,
        :asset_listing_id => 4,
        :type => "Type"
      )
    ])
  end

  it "renders a list of assets" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
  end
end
