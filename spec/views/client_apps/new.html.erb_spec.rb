require 'rails_helper'

RSpec.describe "client_apps/new", type: :view do
  before(:each) do
    assign(:client_app, ClientApp.new(
      :user => nil,
      :name => "MyString"
    ))
  end

  it "renders new client_app form" do
    render

    assert_select "form[action=?][method=?]", client_apps_path, "post" do

      assert_select "input[name=?]", "client_app[user_id]"

      assert_select "input[name=?]", "client_app[name]"
    end
  end
end
