FactoryGirl.define do
  factory :member do
    sequence(:meetup_id) { |n| n }
    raw_data {
      {
        'id' => self.meetup_id,
        'lat' => 1,
        'lon' => -1,
        'city' => 'Dublin',
        'link' => "http://www.meetupdotcom/members/#{self.meetup_id}",
        'name' => Faker::Name.name,
        'self' => {
          'common' => {}
        },
        'photo' => {
          'photo_id' => 1,
          'photo_link' => "http://photos3.meetupstaticdotcom/photos/member/6/1/b/e/member_#{self.meetup_id}.jpeg",
          'thumb_link' => "http://photos3.meetupstaticdotcom/photos/member/6/1/b/e/thumb_#{self.meetup_id}.jpeg",
          'highres_link' => "http://photos3.meetupstaticdotcom/photos/member/6/1/b/e/highres_#{self.meetup_id}.jpeg"
        },
        'joined' => DateTime.now.strftime('%Q'),
        'status' => 'active',
        'topics' => [
          {
            'id' => 1,
            'name' => 'Art',
            'urlkey' => 'art'
          },
          {
            'id' => 2,
            'name' => 'professional-networking',
            'urlkey' => 'business-networking'
          }
        ],
        'country' => 'ie',
        'visited' => DateTime.now.strftime('%Q'),
        'other_services' => {
          'twitter' => {
            'identifier' => '@sometwitterpagexamplehere'
          }
        }
      }
    }
  end
end
