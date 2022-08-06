class Shopping < ApplicationRecord
  has_one :shopping_address
  belongs_to :item
  belongs_to :user
end
