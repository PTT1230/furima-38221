FactoryBot.define do
  factory :user do
    birthday              {Faker::Name.initials}
    last_name_kana        {Faker::Name.last_name}
    last_name_kanji       {Faker::Name.first_name}
    first_name_kana       {Faker::Name.last_name}
    first_name_kanji      {Faker::Name.first_name}
    nickname              {Faker::Name.initials}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
  end
end
#Faker::Name.first_name
#Faker::Name.last_name 