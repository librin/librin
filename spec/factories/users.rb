requiere 'faker'

FactoryGirl.define do
  factory :user do |f|
 f.firstName { Faker::Name.first_name }
    f.lastLame { Faker::Name.last_name }
  end
end