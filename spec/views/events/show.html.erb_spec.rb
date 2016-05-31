require 'rails_helper'

RSpec.describe "events/show", type: :view do
  before(:each) do
    @event = assign(:event, Event.create!(
      :meetup_id => 1,
      :presentation_embeds => "Presentation Embeds",
      :links => "Links",
      :raw_data => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Presentation Embeds/)
    expect(rendered).to match(/Links/)
    expect(rendered).to match(//)
  end
end
