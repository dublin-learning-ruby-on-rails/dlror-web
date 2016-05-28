class DashboardController < ApplicationController
  before_action :synchronise_events, only: :index
  before_action :set_events, only: :index
  before_action :set_posts, only: :index

  def index
    render layout: 'dashboard'
  end

  private

  def synchronise_events
    # synchronise_events
    results = RMeetup_client.fetch(:events, status: ['upcoming', 'past'], group_id: Rails.application.config.meetup_group_id)

    results.each do |result|
      result_hash = result.as_json

      event = Event.where(meetup_id: result.id).first_or_initialize
      if event.raw_data['updated'] != result_hash['event']['updated']
        event.raw_data = result_hash['event']
      end

      event.save! if event.changed?
    end
  end

  def set_events
    @meetup_upcoming_events = Event.where('raw_data @> ?', {status: 'upcoming'}.to_json)
    @meetup_past_events = Event.where('raw_data @> ?', {status: 'past'}.to_json)
  end

  def set_posts
    @posts = Post.all
  end
end
