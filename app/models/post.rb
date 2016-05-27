class Post < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :content, presence: true

  mount_uploader :image, ImageUploader
end
