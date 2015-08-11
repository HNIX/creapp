require 'rails_helper'

RSpec.describe "investors/show", type: :view do
  before(:each) do
    @investor = assign(:investor, Investor.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Linked In/)
    expect(rendered).to match(/Fax/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/Phone 2/)
  end
end
