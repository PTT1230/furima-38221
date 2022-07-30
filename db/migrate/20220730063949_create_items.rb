class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.integer    :category_id,   null: false
      t.integer :condition_id,     null: false
      t.integer :shopping_fee_id,  null: false 
      t.integer :area_id,          null: false
      t.integer :delivery_date_id, null: false
      t.string :item_name,         null: false
      t.integer :price,            null: false
      t.text :explanation,         null: false
      t.references :user,          null: false, foreign_key: true
      t.timestamps
    end
  end
end
