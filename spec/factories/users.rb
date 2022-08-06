FactoryBot.define do
  factory :user do
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation {password}
    birthday              {'1931-01-01'}
    last_name_kana        {'ナマエ'}
    last_name_kanji       {'なまえ'}
    first_name_kana       {'ナマエ'}
    first_name_kanji      {'なまえ'}
    nickname              {'ニックネーム'}
    email                 {Faker::Internet.free_email}
  end
end