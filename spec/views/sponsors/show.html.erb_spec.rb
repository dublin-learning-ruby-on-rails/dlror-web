require 'rails_helper'

RSpec.describe "sponsors/show", type: :view do
  before(:each) do
    @sponsor = assign(:sponsor, Sponsor.create!(
      :name => "Name",
      :link => "Link",
      :image => "Image"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Link/)
    expect(rendered).to match(/Image/)
  end
end
