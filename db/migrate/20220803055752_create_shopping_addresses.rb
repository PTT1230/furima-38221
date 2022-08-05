class CreateShoppingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shopping_addresses do |t|
      t.references :shopping,           null: false, foreign_key: true
      t.integer    :area_id,            null: false
      t.string     :post_code,          null: false
      t.string     :municipalities,     null: false
      t.string     :address,            null: false
      t.string     :building
      t.string     :phone_number,       null: false
      t.timestamps
    end
  end
end