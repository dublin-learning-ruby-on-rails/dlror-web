require 'rails_helper'

RSpec.describe "events/new", type: :view do
  before(:each) do
    assign(:event, Event.new(
      :meetup_id => 1,
      :presentation_embeds => "MyString",
      :links => "MyString",
      :raw_data => ""
    ))
  end

  it "renders new event form" do
    render

    assert_select "form[action=?][method=?]", events_path, "post" do

      assert_select "input#event_meetup_id[name=?]", "event[meetup_id]"

      assert_select "input#event_presentation_embeds[name=?]", "event[presentation_embeds]"

      assert_select "input#event_links[name=?]", "event[links]"

      assert_select "input#event_raw_data[name=?]", "event[raw_data]"
    end
  end
end
