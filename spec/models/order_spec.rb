require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '商品購入情報の保存' do
    before do
      user     = FactoryBot.create(:user)
      item     = FactoryBot.create(:item)
      @order = FactoryBot.build(:order, user_id: user.id, item_id: item.id)
      sleep 0.05
    end
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
      it '郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと' do
        @order.post_code = 1234567
        @order.valid?
        expect(@order.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it '都道府県が必須であること' do
        @order.area_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include("Area must be other than 1")
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
      it '電話番号は、9桁以下では登録できないこと' do
        @order.phone_number = 333
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号は、12桁以上では登録できないこと' do
        @order.phone_number = 333344445555
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号に数値以外が含まれると保存できないこと' do
        @order.phone_number = '１１１１１１１１１１１'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end
      it "tokenが空では登録できないこと" do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐付いていないと保存できないこと' do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end