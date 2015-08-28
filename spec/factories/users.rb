FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password "password"
    confirmed_at { DateTime.now }
  end

end
