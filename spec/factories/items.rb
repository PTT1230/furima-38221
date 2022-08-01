FactoryBot.define do
  factory :item do
    item_name         {'テスト'}
    explanation       {'テスト'}
    price             {11111}
    category_id       {2}
    condition_id      {2}
    shopping_fee_id   {2}
    area_id           {2}
    delivery_date_id  {2}
    
    association :user 

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end