require 'rails_helper'

RSpec.describe "events/edit", type: :view do
  before(:each) do
    @event = assign(:event, Event.create!(
      :meetup_id => 1,
      :presentation_embeds => "MyString",
      :links => "MyString",
      :raw_data => ""
    ))
  end

  it "renders the edit event form" do
    render

    assert_select "form[action=?][method=?]", event_path(@event), "post" do

      assert_select "input#event_meetup_id[name=?]", "event[meetup_id]"

      assert_select "input#event_presentation_embeds[name=?]", "event[presentation_embeds]"

      assert_select "input#event_links[name=?]", "event[links]"

      assert_select "input#event_raw_data[name=?]", "event[raw_data]"
    end
  end
end
