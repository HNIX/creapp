require 'rails_helper'

RSpec.describe "companies/new", type: :view do
  before(:each) do
    assign(:company, Company.new(
      :name => "MyString",
      :url => "MyString",
      :stock_symbol => "MyString",
      :description => "MyText"
    ))
  end

  it "renders new company form" do
    render

    assert_select "form[action=?][method=?]", companies_path, "post" do

      assert_select "input#company_name[name=?]", "company[name]"

      assert_select "input#company_url[name=?]", "company[url]"

      assert_select "input#company_stock_symbol[name=?]", "company[stock_symbol]"

      assert_select "textarea#company_description[name=?]", "company[description]"
    end
  end
end
