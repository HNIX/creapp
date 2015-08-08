require 'rails_helper'

RSpec.describe "tenants/show", type: :view do
  before(:each) do
    @tenant = assign(:tenant, Tenant.create!(
      :name => "Name",
      :size => 1,
      :description => "MyText",
      :asset => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
