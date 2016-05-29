require 'rmeetup'

rmeetup_config = YAML::load(File.open("#{ Rails.root }/config/meetup.yml"))[Rails.env]

RMeetup_client = RMeetup::Client.new do |config|
  config.api_key = rmeetup_config['api_key']
end

Rails.application.config.meetup_group_id = rmeetup_config['group_id']
