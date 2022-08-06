FactoryBot.define do

  factory :order do
    municipalities     {'市町村'}
    post_code          {'123-4567'}
    address            {'番地'}
    phone_number       {33344445555}
    area_id            {2}
    building           {'建物名'}
    token              {"tok_abcdefghijk00000000000000000"}
  end
end