class EventsSponsor < ActiveRecord::Base
  belongs_to :event
  belongs_to :sponsor

  validates :event, presence: true, uniqueness: { scope: :sponsor }
  validates :sponsor, presence: true
end
