require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end
  context '商品を購入できる場合' do
    it '必要な情報を適切に入力すると、商品の購入ができること' do
      expect(@order_address).to be_valid
    end
  end

  context '商品を購入できない場合' do
    it 'クレジットの情報を入力しなければ、商品を購入できない' do
      @order_address.token = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end
    it '郵便番号を入力しなければ、商品を購入できない' do
      @order_address.postcode = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postcode can't be blank")
    end
    it '郵便番号にハイフンがないと、商品を購入できない' do
      @order_address.postcode = "4313111"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postcode Input correctly")
    end
    it '郵便番号を半角英字で入力しなければ、商品を購入できない' do
      @order_address.postcode = "４３１−３１１１"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postcode Input correctly")
    end
    it '都道府県を選択しなければ、商品を購入できない' do
      @order_address.prefecture_id = 1
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefecture Select")
    end
    it '市町村区を入力しなければ、商品を購入できない' do
      @order_address.city = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City can't be blank")
    end
    it '番地を入力しなければ、商品を購入できない' do
      @order_address.block = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Block can't be blank")
    end
    it '電話番号を入力しなければ、商品を購入できない' do
      @order_address.phone_number = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
    end
    it '電話番号を半角数字のみで入力しなければ、購入できない' do
      @order_address.phone_number = "fesdv333ああ"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number Input only number")
    end
  end
end
