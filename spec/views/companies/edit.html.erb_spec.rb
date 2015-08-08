require 'rails_helper'

RSpec.describe "companies/edit", type: :view do
  before(:each) do
    @company = assign(:company, Company.create!(
      :name => "MyString",
      :url => "MyString",
      :stock_symbol => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit company form" do
    render

    assert_select "form[action=?][method=?]", company_path(@company), "post" do

      assert_select "input#company_name[name=?]", "company[name]"

      assert_select "input#company_url[name=?]", "company[url]"

      assert_select "input#company_stock_symbol[name=?]", "company[stock_symbol]"

      assert_select "textarea#company_description[name=?]", "company[description]"
    end
  end
end
