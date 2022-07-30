class Item < ApplicationRecord
  #has_one :shopping
  belongs_to :user
  has_one_attached :image
end
