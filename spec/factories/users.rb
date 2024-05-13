FactoryBot.define do
  factory :user do
    nickname                   { Faker::Name.initials(number: 2) }
    email                      { Faker::Internet.email }
    password                   { Faker::Internet.password(min_length: 6) }
    password_confirmation      { password }
    family_name                { 'あああ' }
    first_name                 { 'あああ' }
    family_name_reading        { 'アアア' }
    first_name_reading         { 'アアア' }
    birthday                   { Faker::Date.birthday }
  end
end
