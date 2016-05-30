class Sponsor < ActiveRecord::Base
  has_many :events_sponsors
  has_many :events, through: :events_sponsors

  validates :name, presence: true, uniqueness: true
  validates :link, presence: true
  validates :image, presence: true

  mount_uploader :image, ImageUploader
end
