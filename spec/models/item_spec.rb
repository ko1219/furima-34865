require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  context '商品を出品できる場合' do
    it '必須項目が全て記入されていれば出品できる' do
      expect(@item).to be_valid
    end
    it '画像ファイルが添付されていれば出品できる' do
      expect(@item.image).to be_valid
    end
    it '商品名が記入されていれば出品できる' do
      @item.name = 'test'
      expect(@item).to be_valid
    end
    it '商品の説明が記入されていれば出品できる' do
      @item.description = 'testtesttest'
      expect(@item).to be_valid
    end
    it 'カテゴリーを選んでいれば出品できる' do
      @item.category_id = 2
      expect(@item).to be_valid
    end
    it '商品の状態を選んでいれば出品できる' do
      @item.status_id = 2
      expect(@item).to be_valid
    end
    it '配送料の負担を選んでいれば出品できる' do
      @item.shipping_charge_id = 2
      expect(@item).to be_valid
    end
    it '配送元の地域を選んでいれば出品できる' do
      @item.prefecture_id = 2
      expect(@item).to be_valid
    end
    it '配送までの日数を選んでいれば出品できる' do
      @item.shipping_day_id = 2
      expect(@item).to be_valid
    end
    it '販売価格を300~9,999,999の範囲で記入していれば出品できる' do
      @item.price = 300
      expect(@item).to be_valid
    end
    it '販売価格を半角数字のみで記入していれば出品できる' do
      @item.price = 500
      expect(@item).to be_valid
    end
  end

  context '商品を出品できない場合' do
    it '画像がない場合は出品できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it '商品名が空の場合出品できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it '商品説明が空の場合出品できない' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end
    it 'カテゴリーを未選択の場合出品できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category Select')
    end
    it '商品の状態が未選択の場合出品できない' do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Status Select')
    end
    it '配送料の負担が未選択の場合出品できない' do
      @item.shipping_charge_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping charge Select')
    end
    it '配送元の地域が未選択の場合出品できない' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Prefecture Select')
    end
    it '配送までの日数が未選択の場合出品できない' do
      @item.shipping_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping day Select')
    end
    it '販売価格が300~9.999.999の範囲外の場合出品できない' do
      @item.price = 100
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Out of setting range')
    end
    it '販売価格が半角数字でない場合出品できない' do
      @item.price = '９００'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Half-width number')
    end
    it '販売価格が未入力の場合出品できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it '販売価格が範囲を超えている場合出品できない' do
      @item.price = 10_000_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Out of setting range')
    end
    it '販売価格が数字でない場合は出品できない' do
      @item.price = 'アイウエオ'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Half-width number')
    end
    it '商品価格が半角英数字混合では出品できない' do
      @item.price = '111１１１'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Half-width number')
    end
    it '商品価格が半角英字のみでは出品できない' do
      @item.price = 'eeeeeee'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Half-width number')
    end
  end
end
