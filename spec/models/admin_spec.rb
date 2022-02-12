require 'rails_helper'

RSpec.describe Admin, type: :model do
  before do
    @admin = FactoryBot.build(:admin)
  end

  describe '登録ができる場合' do
    context '内容に問題がない場合' do
      it '条件通り全ての項目に値が存在すれば登録できる' do
        expect(@admin).to be_valid
      end
    end

    context '登録ができない' do
      it 'companyが空では登録できない' do
        @admin.company = ''
        @admin.valid?
        expect(@admin.errors.full_messages).to include("Company can't be blank")
      end
      it 'emailが空では登録できない' do
        @admin.email = ''
        @admin.valid?
        expect(@admin.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailに@が含まれていない場合登録できない' do
        @admin.email = 'tset.com'
        @admin.valid?
        expect(@admin.errors.full_messages).to include("Email is invalid")
      end
      it 'passwordが空では登録できない' do
        @admin.password = ''
        @admin.valid?
        expect(@admin.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下であれば登録できない' do
        @admin.password = '12345'
        @admin.valid?
        expect(@admin.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'last_nameが空では登録できない' do
        @admin.last_name = ''
        @admin.valid?
        expect(@admin.errors.full_messages).to include("Last name can't be blank")
      end
      it 'last_nameが全角文字でなければ登録できない' do
        @admin.last_name = 'yamada'
        @admin.valid?
        expect(@admin.errors.full_messages).to include("Last name is invalid. Input full-width characters")
      end
      it 'first_nameが空では登録できない' do
        @admin.first_name = ''
        @admin.valid?
        expect(@admin.errors.full_messages).to include("First name can't be blank")
      end
      it 'first_nameが全角文字でなければ登録できない' do
        @admin.first_name = 'taro'
        @admin.valid?
        expect(@admin.errors.full_messages).to include("First name is invalid. Input full-width characters")
      end
      it 'last_name_kanaが空では登録できない' do
        @admin.last_name_kana = ''
        @admin.valid?
        expect(@admin.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'last_name_kanaが全角カタカナでなければ登録できない' do
        @admin.last_name_kana = '山田'
        @admin.valid?
        expect(@admin.errors.full_messages).to include("Last name kana is invalid. Input full-width katakana characters")
      end
      it 'first_name_kanaが空では登録できない' do
        @admin.first_name_kana = ''
        @admin.valid?
        expect(@admin.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'first_name_kanaが全角カタカナでなければ登録できない' do
        @admin.first_name_kana = 'たろう'
        @admin.valid?
        expect(@admin.errors.full_messages).to include("First name kana is invalid. Input full-width katakana characters")
      end
      it 'phone_numberが空では保存できない' do
        @admin.phone_number = ''
        @admin.valid?
        expect(@admin.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが10桁以上11桁以内でなければ保存できない' do
        @admin.phone_number = '123456789'
        @admin.valid?
        expect(@admin.errors.full_messages).to include("Phone number is too short")
      end
      it 'phone_numberが半角数値以外では保存できない' do
        @admin.phone_number = 'abcdefghijk'
        @admin.valid?
        expect(@admin.errors.full_messages).to include("Phone number is invalid. Input only numbers")
      end
    end
  end
end
