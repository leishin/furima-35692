require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '商品出品できる時' do
      it '全ての値が正しく入力されていれば保存できること' do
        expect(@item).to be_valid
      end

      it 'nameが40文字以下だと登録できること' do
        @item.name = 'a'*40
        expect(@item).to be_valid
      end

      it 'textが1000文字以下だと登録できること' do
        @item.text = 'a'*1000
        expect(@item).to be_valid
      end

      it 'priceが300以上だと登録できること' do
        @item.price = 300
        expect(@item).to be_valid
      end

      it 'priceが9,999,999以下だと登録できること' do
        @item.price = 9_999_999
        expect(@item).to be_valid
      end

      it 'priceが半角数字だと登録できること' do
        @item.price = '2000'
        expect(@item).to be_valid
      end
    end

    context '商品出品できない時' do
      it 'nameが空だと保存できないこと' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'imageが空では登録できないこと' do
        @item.image=nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'textが空だと保存んできないこと' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end

      it 'category_idを選択していないと保存できないこと' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 0')
      end

      it 'status_idを選択していないと保存できないこと' do
        @item.status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Status must be other than 0')
      end

      it 'delivery_charge_idを選択しないと保存できないこと' do
        @item.delivery_charge_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery charge must be other than 0')
      end

      it 'prefecture_idを選択しないと保存できないこと' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 0')
      end

      it 'delivery_day_idを選択しないと保存できないこと' do
        @item.delivery_day_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery day must be other than 0')
      end

      it 'priceが空だと保存できないこと' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが全角数字だと保存できないこと' do
        @item.price = '２０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it 'priceが300円未満では保存できないこと' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it 'priceが9,999,999円を超過すると保存できないこと' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end

      it 'userが紐づいていないと保存できないこと' do
        @item.user_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include
      end

      it 'nameが41文字以上だと登録できないこと' do
        @item.name = 'a'*41
        @item.valid?
        expect(@item.errors.full_messages).to include('Name is too long (maximum is 40 characters)')
      end

      it 'textが1001文字以上だと登録できないこと' do
        @item.text = 'a'*1001
        @item.valid?
        expect(@item.errors.full_messages).to include('Text is too long (maximum is 1000 characters)')
      end

      it 'priceが半角英数字混合では登録できない' do
        @item.price='11aa'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it 'priceが半角英字のみでは登録できない' do
        @item.price='aaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end
