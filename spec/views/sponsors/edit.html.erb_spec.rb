require 'rails_helper'

RSpec.describe "sponsors/edit", type: :view do
  before(:each) do
    @sponsor = assign(:sponsor, Sponsor.create!(
      :name => "MyString",
      :link => "MyString",
      :image => "MyString"
    ))
  end

  it "renders the edit sponsor form" do
    render

    assert_select "form[action=?][method=?]", sponsor_path(@sponsor), "post" do

      assert_select "input#sponsor_name[name=?]", "sponsor[name]"

      assert_select "input#sponsor_link[name=?]", "sponsor[link]"

      assert_select "input#sponsor_image[name=?]", "sponsor[image]"
    end
  end
end
