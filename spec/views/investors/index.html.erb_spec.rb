require 'rails_helper'

RSpec.describe "investors/index", type: :view do
  before(:each) do
    assign(:investors, [
      Investor.create!(
        :company => nil,
        :title => "Title",
        :linked_in => "Linked In",
        :fax => "Fax",
        :price_from => 1,
        :price_to => 2,
        :verified => false,
        :principal => false,
        :subscribed => false,
        :user => nil,
        :phone => "Phone",
        :phone_2 => "Phone 2"
      ),
      Investor.create!(
        :company => nil,
        :title => "Title",
        :linked_in => "Linked In",
        :fax => "Fax",
        :price_from => 1,
        :price_to => 2,
        :verified => false,
        :principal => false,
        :subscribed => false,
        :user => nil,
        :phone => "Phone",
        :phone_2 => "Phone 2"
      )
    ])
  end

  it "renders a list of investors" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Linked In".to_s, :count => 2
    assert_select "tr>td", :text => "Fax".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Phone 2".to_s, :count => 2
  end
end
