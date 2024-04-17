FactoryBot.define do
  factory :furima do
    title                  { Faker::Name.initials(number: 2) }
    description            { Faker::Lorem.sentence }
    category_id            { Faker::Number.between(from: 2, to: 11) }
    condition_id           { Faker::Number.between(from: 2, to: 7) }
    burden_id              { Faker::Number.between(from: 2, to: 3) }
    area_id                { Faker::Number.between(from: 2, to: 48) }
    number_of_day_id       { Faker::Number.between(from: 2, to: 4) }
    price                  { Faker::Commerce.price(range: 300..9_999_999, as_string: true) }
    after(:build) do |object|
      object.image.attach(io: File.open('spec/factories/test.jpg'), filename: 'test.jpg', content_type: 'image/jpeg')
    end
    association :user
  end
end
