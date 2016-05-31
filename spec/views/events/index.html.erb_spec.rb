require 'rails_helper'

RSpec.describe "events/index", type: :view do
  before(:each) do
    assign(:events, [
      Event.create!(
        :meetup_id => 1,
        :presentation_embeds => "Presentation Embeds",
        :links => "Links",
        :raw_data => ""
      ),
      Event.create!(
        :meetup_id => 1,
        :presentation_embeds => "Presentation Embeds",
        :links => "Links",
        :raw_data => ""
      )
    ])
  end

  it "renders a list of events" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Presentation Embeds".to_s, :count => 2
    assert_select "tr>td", :text => "Links".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
