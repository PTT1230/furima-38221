require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品が出品ができる場合' do
      it 'すべて入力されていれば保存できる' do
        expect(@item).to be_valid
      end
    end
    context '商品を出品できない場合' do
      it 'category_idが空では保存できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'area_idが空では保存できない' do
        @item.area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end
      it 'shopping_fee_idが空では保存できない' do
        @item.shopping_fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shopping fee can't be blank")
      end
      it 'condition_idが空では保存できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it 'delivery_date_idが空では保存できない' do
        @item.delivery_date_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery date can't be blank")
      end
      it 'item_nameが空では保存できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'imageが空では保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
      it '価格が空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格に半角数字以外が含まれている場合は出品できない（※半角数字以外が一文字でも含まれていれば良い）' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it '価格が300円未満では出品できない' do
        @item.price = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it '価格が9_999_999円を超えると出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it '商品説明が空では出品できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'カテゴリーに「---」が選択されている場合は出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態に「---」が選択されている場合は出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it '配送料の負担に「---」が選択されている場合は出品できない' do
        @item.shopping_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shopping fee can't be blank")
      end
      it '発送元の地域に「---」が選択されている場合は出品できない' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end
      it '発送までの日数に「---」が選択されている場合は出品できない' do
        @item.delivery_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery date can't be blank")
      end
    end
  end
end

