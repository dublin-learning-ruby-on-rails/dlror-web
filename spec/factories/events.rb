FactoryGirl.define do
  factory :event do
    sequence(:meetup_id) { |n| n }
    presentation_embeds ['<iframe>...</iframe>']
    links ['http:/localhost:3000/somefile.pdf']
  end
end
