require 'rails_helper'

RSpec.describe "client_apps/show", type: :view do
  before(:each) do
    @client_app = assign(:client_app, ClientApp.create!(
      :user => nil,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
  end
end
