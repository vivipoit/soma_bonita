FactoryGirl.define do
  factory :tour do
    name 'Rio Sucuri'
    description Faker::Lorem.paragraph(2)
    attraction 'Nascente Rio Sucuri'
    duration 150
    distance 19
    site 'http://riosucuri.com.br/'
    category
  end
end
