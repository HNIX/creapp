require 'rails_helper'

RSpec.describe "tenants/index", type: :view do
  before(:each) do
    assign(:tenants, [
      Tenant.create!(
        :name => "Name",
        :size => 1,
        :description => "MyText",
        :asset => nil
      ),
      Tenant.create!(
        :name => "Name",
        :size => 1,
        :description => "MyText",
        :asset => nil
      )
    ])
  end

  it "renders a list of tenants" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
