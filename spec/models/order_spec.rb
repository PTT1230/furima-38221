require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  describe '商品購入情報の保存' do

    context '内容に問題がない場合' do
      it '全ての項目が存在すれば登録できる' do
        expect(@order).to be_valid
      end
      it '建物名は任意であること' do
        @order.building = ''
        expect(@order).to be_valid
      end
    end
    context '内容に問題がある場合' do
      it '郵便番号が必須であること' do
        @order.post_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code can't be blank")

      end
      it '郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと（良い例：123-4567　良くない例：1234567）' do
        @order.post_code = 1234567
        @order.valid?
        expect(@order.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')

      end
      it '都道府県が必須であること' do
        @order.area_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include("Area can't be blank")
      end
      it '市区町村が必須であること' do
        @order.municipalities = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Municipalities can't be blank")

      end
      it '番地が必須であること' do
        @order.address = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")

      end
      it '電話番号が必須であること' do
        @order.phone_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号は、10桁以上11桁以内の半角数値のみ保存可能なこと（良い例：09012345678　良くない例：090-1234-5678）' do
        @order.phone_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end
    end
  end
end
