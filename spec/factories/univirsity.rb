FactoryGirl.define do
  factory :university do
    name Faker::Company.name
    logo_url Faker::Company.logo
    description nil
  end
end
