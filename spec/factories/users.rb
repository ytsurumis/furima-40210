FactoryBot.define do
  factory :user do
    nickname                   {'test'}
    email                      {'test@example'}
    password                   {'00000a'}
    password_confirmation      {password}
    family_name                {'テスト'}
    first_name                 {'テスト'}
    family_name_reading        {'テスト'}
    first_name_reading         {'テスト'}
    birthday                   {'1945-01-01'}
  end
end