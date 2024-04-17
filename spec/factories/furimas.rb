FactoryBot.define do
  factory :furima do
    title                  { Faker::Name.initials(number: 2) }
    description            { Faker::Lorem.sentence }
    category_id            { Faker::Number.number(digits: rand(1..2)) }
    condition_id           { Faker::Number.number(digits: rand(1..2)) }
    burden_id              { Faker::Number.number(digits: rand(1..2)) }
    area_id                { Faker::Number.number(digits: rand(1..2)) }
    number_of_day_id       { Faker::Number.number(digits: rand(1..2)) }
    price                  { Faker::Commerce.price(range: 300..9_999_999, as_string: true) }
    association :user
  end
end