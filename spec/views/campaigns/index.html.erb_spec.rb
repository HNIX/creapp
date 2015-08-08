require 'rails_helper'

RSpec.describe "campaigns/index", type: :view do
  before(:each) do
    assign(:campaigns, [
      Campaign.create!(
        :client => nil,
        :asset => nil,
        :sent => false,
        :send_now => false,
        :step_1_complete => false,
        :step_2_complete => false,
        :step_3_complete => false,
        :step_4_complete => false,
        :authorized => false
      ),
      Campaign.create!(
        :client => nil,
        :asset => nil,
        :sent => false,
        :send_now => false,
        :step_1_complete => false,
        :step_2_complete => false,
        :step_3_complete => false,
        :step_4_complete => false,
        :authorized => false
      )
    ])
  end

  it "renders a list of campaigns" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
