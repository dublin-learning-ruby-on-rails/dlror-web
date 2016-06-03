FactoryGirl.define do
  factory :photo do
    sequence(:meetup_id) { |n| n }
    event { build(:event) }
    raw_data {
      {
        'member' => {
          'name' => Faker::Name.name,
          'member_id' => 1
        },
        'created' => DateTime.now.strftime('%Q'),
        'updated' => DateTime.now.strftime('%Q'),
        'photo_id' => meetup_id,
        'site_link' => "http://www.meetupdotcom/Dublin-Learning-Ruby-on-Rails-Meetup/photos/SOMEPHOTOALBUMID/#{self.meetup_id}/",
        'photo_link' => "http://photos3.meetupstaticdotcom/photos/event/6/9/9/c/600_#{self.meetup_id}.jpeg",
        'thumb_link' => "http://photos3.meetupstaticdotcom/photos/event/6/9/9/c/thumb_#{self.meetup_id}.jpeg",
        'utc_offset' => 3600000,
        'photo_album' => {
          'event_id' => '1',
          'group_id' => 1,
          'photo_album_id' => 1
        },
        'highres_link' => "http://photos3.meetupstaticdotcom/photos/event/6/9/9/c/highres_#{self.meetup_id}.jpeg"
      }
    }
  end
end
