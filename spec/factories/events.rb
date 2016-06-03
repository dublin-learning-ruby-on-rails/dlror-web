FactoryGirl.define do
  factory :event do
    sequence(:meetup_id) { |n| n }
    presentation_embeds ['<iframe>...</iframe>']
    links ['http:/localhost:3000/somefile.pdf']
    raw_data {
      {
        'id' => self.meetup_id,
        'name' => 'Learn Ruby-on-Rails Basics',
        'time' => DateTime.now.strftime('%Q'),
        'group' => {
          'id' => 1,
          'who' => 'Aspirants',
          'name' => 'Dublin Learning Ruby-on-Rails Meetup',
          'created' => DateTime.now.strftime('%Q'),
          'urlname' => 'Dublin-Learning-Ruby-on-Rails-Meetup',
          'group_lat' => 1,
          'group_lon' => -1,
          'join_mode' => 'open'
        },
        'venue' => {
          'id' => 1,
          'lat' => 1,
          'lon' => -1,
          'city' => 'Dublin',
          'name' => 'Somewhere',
          'country' => 'ie',
          'repinned' => false,
          'address_1' => 'http://example.website/',
          'localized_country_name' => 'Ireland'
        },
        'rating' => {
          'count' => 2,
          'average' => 4.5
        },
        'status' => 'past',
        'created' => (DateTime.now - 1.week).strftime('%Q'),
        'updated' => (DateTime.now - 1.week).strftime('%Q'),
        'duration' => 10800000,
        'announced' => true,
        'event_url' => "http://www.meetupdotcom/SOMEEXAMPLEGROUPNAME/events/#{self.meetup_id}/",
        'headcount' => 17,
        'rsvp_limit' => 17,
        'utc_offset' => 3600000,
        'visibility' => 'public',
        'description' => Faker::Lorem.paragraph,
        'waitlist_count' => 5,
        'yes_rsvp_count' => 17,
        'maybe_rsvp_count' => 0
      }
    }
  end
end
