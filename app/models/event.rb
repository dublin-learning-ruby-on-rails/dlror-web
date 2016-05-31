class Event < ActiveRecord::Base
  has_many :events_sponsors
  has_many :sponsors, through: :events_sponsors

  validates :meetup_id, presence: true

  before_save :remove_blank_links_and_presentation_embeds

  # helper method to calculate
  def time
    Time.strptime(raw_data['time'].to_s, '%Q').in_time_zone
  end

  protected

  def remove_blank_links_and_presentation_embeds
    self.links = self.links.compact.reject(&:blank?) if links.present?
    self.presentation_embeds = self.presentation_embeds.compact.reject(&:blank?) if presentation_embeds.present?
  end
end
