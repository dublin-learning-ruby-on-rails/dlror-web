class Photo < ActiveRecord::Base
  belongs_to :event

  validates :event, presence: true
  validates :meetup_id, presence: true, uniqueness: true
end
