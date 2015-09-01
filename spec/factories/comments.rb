FactoryGirl.define do
  factory :comment do
    task
    text { Faker::Lorem.sentence }
  end

end
