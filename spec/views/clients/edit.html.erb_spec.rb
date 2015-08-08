require 'rails_helper'

RSpec.describe "clients/edit", type: :view do
  before(:each) do
    @client = assign(:client, Client.create!(
      :user => nil,
      :name => "MyString",
      :subdomain => "MyString",
      :url => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit client form" do
    render

    assert_select "form[action=?][method=?]", client_path(@client), "post" do

      assert_select "input#client_user_id[name=?]", "client[user_id]"

      assert_select "input#client_name[name=?]", "client[name]"

      assert_select "input#client_subdomain[name=?]", "client[subdomain]"

      assert_select "input#client_url[name=?]", "client[url]"

      assert_select "textarea#client_description[name=?]", "client[description]"
    end
  end
end
