require 'rails_helper'

RSpec.describe "assets/show", type: :view do
  before(:each) do
    @asset = assign(:asset, Asset.create!(
      :client => nil,
      :name => "Name",
      :description => "MyText",
      :size => 1,
      :land_size => 2,
      :price => 1.5,
      :price_psf => 1.5,
      :hide_price => false,
      :cap_rate => 1.5,
      :occupancy => 1.5,
      :highlights => "MyText",
      :year_built => "Year Built"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Year Built/)
  end
end
