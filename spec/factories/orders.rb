FactoryBot.define do
  factory :order do
    municipalities {'市町村'}
    post_code {'123-4567'}
    address {'番地'}
    phone_number {12345678901}
    area_id {2}
    building {'建物名'}
  end
end