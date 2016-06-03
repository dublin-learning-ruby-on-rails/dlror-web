FactoryGirl.define do
  factory :events_sponsor do
    event { build(:event) }
    sponsor { build(:sponsor) }
  end
end
