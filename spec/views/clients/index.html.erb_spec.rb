require 'rails_helper'

RSpec.describe "clients/index", type: :view do
  before(:each) do
    assign(:clients, [
      Client.create!(
        :user => nil,
        :name => "Name",
        :subdomain => "Subdomain",
        :url => "Url",
        :description => "MyText"
      ),
      Client.create!(
        :user => nil,
        :name => "Name",
        :subdomain => "Subdomain",
        :url => "Url",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of clients" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Subdomain".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
