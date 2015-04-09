FactoryGirl.define do
  factory :store do
    name 'yoshinoya'
    address Faker::Address.street_address
    latitude Faker::Address.latitude
    longitude Faker::Address.longitude
    url Faker::Internet.url
    tel Faker::PhoneNumber.phone_number
    store_image_url Faker::Company.logo
  end
end
