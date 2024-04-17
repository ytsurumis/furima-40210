require 'rails_helper'

RSpec.describe Furima, type: :model do
  before do
    @furima = FactoryBot.build(:furima)
  end

  describe '商品出品機能（正常系）' do
    context '出品できるとき' do
      it '必要な情報が存在すれば出品できる' do
        expect(@furima).to be_valid
      end
    end
  end

  describe '商品出品機能（異常系）' do
    context '出品できないとき' do
      it '画像なしでは出品できない' do
        @furima.image.purge
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Image can't be blank")
      end

      it '商品の名前が空では出品できない' do
        @furima.title = ''
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Title can't be blank")
      end

      it '商品の説明が空では出品できない' do
        @furima.description = ''
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Description can't be blank")
      end

      it '商品のカテゴリーが空だと出品できない' do
        @furima.category_id = 1
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Category can't be blank")
      end

      it '商品の状態が空だと出品できない' do
        @furima.condition_id = 1
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Condition can't be blank")
      end

      it '配送料の負担が空だと出品できない' do
        @furima.burden_id = 1
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Burden can't be blank")
      end

      it '発送元の地域が空だと出品できない' do
        @furima.area_id = 1
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Area can't be blank")
      end

      it '発送までの日数が空だと出品できない' do
        @furima.number_of_day_id = 1
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Number of day can't be blank")
      end

      it '価格が空だと出品できない' do
        @furima.price = ''
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Price can't be blank")
      end

      it '価格が半角数値でなければ出品できない' do
        @furima.price = 'aaa'
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Price is not a number")
      end

      it '商品の価格は300未満だと出品できない' do
        @furima.price = 299
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it '商品の価格は9,999,999より大きいと出品できない' do
        @furima.price = 10_000_000
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

      it 'ユーザーが紐づいていなければ出品できない' do
        @furima.user = nil
        @furima.valid?
        expect(@furima.errors.full_messages).to include('User must exist')
      end
    end
  end
end
