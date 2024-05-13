require 'rails_helper'

RSpec.describe PurchaseShipping, type: :model do
  before do
    user = FactoryBot.create(:user)
    furima = FactoryBot.create(:furima, user_id: user.id)
    @purchase_shipping = FactoryBot.build(:purchase_shipping, user_id: user.id, furima_id: furima.id)
  end
  describe '購入者情報の保存' do
    context '内容に問題がない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_shipping).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @purchase_shipping.building = ''
        expect(@purchase_shipping).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空だと保存できないこと' do
        @purchase_shipping.post_code = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchase_shipping.post_code = '1234567'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'areaを選択していないと保存できないこと' do
        @purchase_shipping.area_id = 1
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Area can't be blank")
      end
      it 'municipalitiesが空だと保存できないこと' do
        @purchase_shipping.municipalities = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'phoneが空だと保存できないこと' do
        @purchase_shipping.phone = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Phone can't be blank")
      end
      it 'phoneが短すぎると保存できないこと' do
        @purchase_shipping.phone = '12345'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include('Phone is too short')
      end
      it 'phoneが数字以外では保存できないこと' do
        @purchase_shipping.phone = 'aaaaaaaaaaa'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include('Phone is not a number')
      end
      it 'tokenが空では登録できないこと' do
        @purchase_shipping.token = nil
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
