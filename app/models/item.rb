class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shopping_fee
  belongs_to :area
  belongs_to :delivery_date
  #has_one :shopping
  belongs_to :user
  has_one_attached :image

  validates :category_id,      numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id,     numericality: { other_than: 1, message: "can't be blank" }
  validates :shopping_fee_id,  numericality: { other_than: 1, message: "can't be blank" }
  validates :area_id,          numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_date_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :item_name,        presence: true
  validates :price,            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                               format: { with: /\A[0-9]+\z/ }
  validates :explanation,      presence: true
  validates :user,             presence: true
end

#presence: true, format: { with: /\A[0-9]+\z/ , /\A[+-]?\d+\z/ }, length: { minimum: 300, maximum: 9999999 }, numericality: {only_integer: true }
#数値を通貨のフォーマットに変換少数以下は無視number_to_currency :strip_insignificant_zeros	