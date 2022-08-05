class Order
  include ActiveModel::Model
  attr_accessor :post_code, :municipalities, :address, :building, :phone_number, :area_id, :shopping_id, :user_id, :item_id, :item_name

  with_options presence: true do 
    validates :post_code,  format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipalities
    validates :address
    validates :phone_number
    #validates :user_id
    #validates :item_id
    #validates :shopping_id
  end
  validates :area_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, municipalities: municipalities, address: address,
                   building: building, phone_number: phone_number, area_id: area.id, user_id: user.id, order_id: order.id)
  end
end