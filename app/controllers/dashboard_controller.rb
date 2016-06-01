class DashboardController < ApplicationController
  before_action :set_links, only: :index
  before_action :set_events, only: :index
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
    # For some reason rmeetup gem doesn't support array: ['upcoming', 'past'] to be param values for :status, so split into two requests
    ['upcoming', 'past'].each do |status|
      results = RMeetup_client.fetch(:events, status: status, group_id: Rails.application.config.meetup_group_id)

      results.each do |result|
        result_hash = result.as_json

        event = Event.where(meetup_id: result.id).first_or_initialize
        if event.raw_data['updated'] != result_hash['event']['updated']
          event.raw_data = result_hash['event']
        end

        event.save! if event.changed?
      end
    end
  end

  def set_events
    @upcoming_events = Event.where('raw_data @> ?', {status: 'upcoming'}.to_json)
    @past_events = Event.where('raw_data @> ?', {status: 'past'}.to_json)
  end

  def set_members
    @members = Member.all.shuffle
  end

  def set_posts
    @posts = Post.all
  end
end
