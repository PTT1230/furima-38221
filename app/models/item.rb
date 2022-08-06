class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shopping_fee
  belongs_to :area
  belongs_to :delivery_date
  has_one    :shopping
  belongs_to :user
  has_one_attached :image

  validates :category_id,      numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id,     numericality: { other_than: 1, message: "can't be blank" }
  validates :shopping_fee_id,  numericality: { other_than: 1, message: "can't be blank" }
  validates :area_id,          numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_date_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :item_name,        presence: true
  validates :price,            presence: true, format: { with: /\A[0-9]+\z/ }, numericality: { only_integer: true },
                               numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :explanation,      presence: true
  validates :image,            presence: true

  def was_attached?
    self.image.attached?
  end
end