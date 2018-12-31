require 'rails_helper'

RSpec.describe "client_apps/edit", type: :view do
  before(:each) do
    @client_app = assign(:client_app, ClientApp.create!(
      :user => nil,
      :name => "MyString"
    ))
  end

  it "renders the edit client_app form" do
    render

    assert_select "form[action=?][method=?]", client_app_path(@client_app), "post" do

      assert_select "input[name=?]", "client_app[user_id]"

      assert_select "input[name=?]", "client_app[name]"
    end
  end
end
