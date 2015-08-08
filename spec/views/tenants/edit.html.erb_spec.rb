require 'rails_helper'

RSpec.describe "tenants/edit", type: :view do
  before(:each) do
    @tenant = assign(:tenant, Tenant.create!(
      :name => "MyString",
      :size => 1,
      :description => "MyText",
      :asset => nil
    ))
  end

  it "renders the edit tenant form" do
    render

    assert_select "form[action=?][method=?]", tenant_path(@tenant), "post" do

      assert_select "input#tenant_name[name=?]", "tenant[name]"

      assert_select "input#tenant_size[name=?]", "tenant[size]"

      assert_select "textarea#tenant_description[name=?]", "tenant[description]"

      assert_select "input#tenant_asset_id[name=?]", "tenant[asset_id]"
    end
  end
end
