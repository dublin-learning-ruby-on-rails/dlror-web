class Event < ActiveRecord::Base
  has_many :events_sponsors
  has_many :sponsors, through: :events_sponsors

  validates :meetup_id, presence: true

  # helper method to calculate
  def time
    Time.strptime(raw_data['time'].to_s, '%Q').in_time_zone
  end
end
