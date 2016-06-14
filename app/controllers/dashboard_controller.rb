class DashboardController < ApplicationController
  before_action :set_links, only: :index
  before_action :set_events, only: :index
  before_action :set_members, only: :index
  before_action :set_posts, only: :index

  layout 'dashboard'

  def index
  end

  private

  def set_links
    @meetup_group_link = 'http://www.meetup.com/Dublin-Learning-Ruby-on-Rails-meetup/'
    @git_repo_link = 'https://github.com/dublin-learning-ruby-on-rails'
  end

  def set_events
    @upcoming_events = Event.includes(:photos).where('raw_data @> ?', {status: 'upcoming'}.to_json).order("raw_data -> 'time' ASC")
    @past_events = Event.includes(:photos).where('raw_data @> ?', {status: 'past'}.to_json).order("raw_data -> 'time' DESC")
  end

  def set_members
    @members = Member.all.order('RANDOM()')
  end

  def set_posts
    @posts = Post.all
  end
end
