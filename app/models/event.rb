class Event < ActiveRecord::Base
  has_many :events_sponsors
  has_many :sponsors, through: :events_sponsors

  validates :meetup_id, presence: true
end
