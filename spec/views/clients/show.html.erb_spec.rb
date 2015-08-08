require 'rails_helper'

RSpec.describe "clients/show", type: :view do
  before(:each) do
    @client = assign(:client, Client.create!(
      :user => nil,
      :name => "Name",
      :subdomain => "Subdomain",
      :url => "Url",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Subdomain/)
    expect(rendered).to match(/Url/)
    expect(rendered).to match(/MyText/)
  end
end
