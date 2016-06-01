class Member < ActiveRecord::Base
  validates :meetup_id, presence: true, uniqueness: true
end
