require 'rails_helper'

RSpec.describe "sponsors/index", type: :view do
  before(:each) do
    assign(:sponsors, [
      Sponsor.create!(
        :name => "Name",
        :link => "Link",
        :image => "Image"
      ),
      Sponsor.create!(
        :name => "Name",
        :link => "Link",
        :image => "Image"
      )
    ])
  end

  it "renders a list of sponsors" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Link".to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
  end
end
