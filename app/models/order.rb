class Order
  include ActiveModel::Model
  attr_accessor :post_code, :municipalities, :address, :building, :phone_number, :area_id, :shopping_id, :user_id, :item_id, :token

  with_options presence: true do 
    validates :post_code,  format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipalities
    validates :address
    validates :phone_number, format: { with: /\A[0-9]{10,11}\z/}
    validates :token
    validates :user_id
    validates :item_id
  end
  validates :area_id, numericality: { other_than: 1}

  def save
    order = Shopping.create(item_id: item_id, user_id: user_id)
    ShoppingAddress.create(post_code: post_code, municipalities: municipalities, address: address,
                   building: building, phone_number: phone_number, area_id: area_id, shopping_id:order.id)
  end
end