require 'rails_helper'

RSpec.describe "investors/edit", type: :view do
  before(:each) do
    @investor = assign(:investor, Investor.create!(
      :company => nil,
      :title => "MyString",
      :linked_in => "MyString",
      :fax => "MyString",
      :price_from => 1,
      :price_to => 1,
      :verified => false,
      :principal => false,
      :subscribed => false,
      :user => nil,
      :phone => "MyString",
      :phone_2 => "MyString"
    ))
  end

  it "renders the edit investor form" do
    render

    assert_select "form[action=?][method=?]", investor_path(@investor), "post" do

      assert_select "input#investor_company_id[name=?]", "investor[company_id]"

      assert_select "input#investor_title[name=?]", "investor[title]"

      assert_select "input#investor_linked_in[name=?]", "investor[linked_in]"

      assert_select "input#investor_fax[name=?]", "investor[fax]"

      assert_select "input#investor_price_from[name=?]", "investor[price_from]"

      assert_select "input#investor_price_to[name=?]", "investor[price_to]"

      assert_select "input#investor_verified[name=?]", "investor[verified]"

      assert_select "input#investor_principal[name=?]", "investor[principal]"

      assert_select "input#investor_subscribed[name=?]", "investor[subscribed]"

      assert_select "input#investor_user_id[name=?]", "investor[user_id]"

      assert_select "input#investor_phone[name=?]", "investor[phone]"

      assert_select "input#investor_phone_2[name=?]", "investor[phone_2]"
    end
  end
end
