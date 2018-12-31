require 'rails_helper'

RSpec.describe "client_apps/index", type: :view do
  before(:each) do
    assign(:client_apps, [
      ClientApp.create!(
        :user => nil,
        :name => "Name"
      ),
      ClientApp.create!(
        :user => nil,
        :name => "Name"
      )
    ])
  end

  it "renders a list of client_apps" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
