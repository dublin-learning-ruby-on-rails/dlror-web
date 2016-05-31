require 'rails_helper'

RSpec.describe "sponsors/new", type: :view do
  before(:each) do
    assign(:sponsor, Sponsor.new(
      :name => "MyString",
      :link => "MyString",
      :image => "MyString"
    ))
  end

  it "renders new sponsor form" do
    render

    assert_select "form[action=?][method=?]", sponsors_path, "post" do

      assert_select "input#sponsor_name[name=?]", "sponsor[name]"

      assert_select "input#sponsor_link[name=?]", "sponsor[link]"

      assert_select "input#sponsor_image[name=?]", "sponsor[image]"
    end
  end
end
