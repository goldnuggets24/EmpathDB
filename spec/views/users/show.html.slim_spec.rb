require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :latitude => 1.5,
      :longitude => 1.5,
      :address => "Address",
      :description => "Description",
      :title => "Title"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Title/)
  end
end