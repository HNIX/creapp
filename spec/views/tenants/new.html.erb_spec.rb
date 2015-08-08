require 'rails_helper'

RSpec.describe "tenants/new", type: :view do
  before(:each) do
    assign(:tenant, Tenant.new(
      :name => "MyString",
      :size => 1,
      :description => "MyText",
      :asset => nil
    ))
  end

  it "renders new tenant form" do
    render

    assert_select "form[action=?][method=?]", tenants_path, "post" do

      assert_select "input#tenant_name[name=?]", "tenant[name]"

      assert_select "input#tenant_size[name=?]", "tenant[size]"

      assert_select "textarea#tenant_description[name=?]", "tenant[description]"

      assert_select "input#tenant_asset_id[name=?]", "tenant[asset_id]"
    end
  end
end
