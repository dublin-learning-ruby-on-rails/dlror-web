class DashboardController < ApplicationController
  before_action :set_links, only: :index
  before_action :synchronise_events, only: :index
  before_action :set_events, only: :index
  before_action :set_event_photos, only: :index
  before_action :set_members, only: :index
  before_action :set_posts, only: :index

  def index
    render layout: 'dashboard'
  end

  private

  def set_links
    @meetup_group_link = 'http://www.meetup.com/Dublin-Learning-Ruby-on-Rails-meetup/'
    @git_repo_link = 'https://github.com/dublin-learning-ruby-on-rails'
  end

  def synchronise_events
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

  def set_event_photos
    @meetup_event_photos = {}
    (@meetup_upcoming_events + @meetup_past_events).each do |meetup_event|
      meetup_event_id = meetup_event.raw_data['id']
      @meetup_event_photos[meetup_event_id] = RMeetup_client.fetch(:photos, event_id: meetup_event_id)
    end
  end

  def set_members
    @meetup_members = RMeetup_client.fetch(:members, group_id: Rails.application.config.meetup_group_id).shuffle
  end

  def set_posts
    @posts = Post.all
  end
end
