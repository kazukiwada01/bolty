require "rails_helper"

RSpec.describe Partner, type: :model do
  before do
    @partner = FactoryBot.build(:partner)
  end

  describe "パートナー登録申請" do
    context "内容に問題がない場合" do
      it "条件通り全ての項目に値が存在すれば登録できる" do
        expect(@partner).to be_valid
      end
      it "messageは空でも登録できる" do
        @partner.message = ""
        expect(@partner).to be_valid
      end
    end

    context "確認画面に進めない場合" do
      it "companyが空では登録できない" do
        @partner.company = ""
        @partner.valid?
        expect(@partner.errors.full_messages).to include("Company can't be blank")
      end
      it "emailが空では登録できない" do
        @partner.email = ""
        @partner.valid?
        expect(@partner.errors.full_messages).to include("Email can't be blank")
      end
      it "emailに@が含まれていない場合登録できない" do
        @partner.email = "tset.com"
        @partner.valid?
        expect(@partner.errors.full_messages).to include("Email is invalid")
      end
      it "last_nameが空では登録できない" do
        @partner.last_name = ""
        @partner.valid?
        expect(@partner.errors.full_messages).to include("Last name can't be blank")
      end
      it "last_nameが全角文字でなければ登録できない" do
        @partner.last_name = "yamada"
        @partner.valid?
        expect(@partner.errors.full_messages).to include("Last name is invalid. Input full-width characters")
      end
      it "first_nameが空では登録できない" do
        @partner.first_name = ""
        @partner.valid?
        expect(@partner.errors.full_messages).to include("First name can't be blank")
      end
      it "first_nameが全角文字でなければ登録できない" do
        @partner.first_name = "taro"
        @partner.valid?
        expect(@partner.errors.full_messages).to include("First name is invalid. Input full-width characters")
      end
      it "last_name_kanaが空では登録できない" do
        @partner.last_name_kana = ""
        @partner.valid?
        expect(@partner.errors.full_messages).to include("Last name kana can't be blank")
      end
      it "last_name_kanaが全角カタカナでなければ登録できない" do
        @partner.last_name_kana = "山田"
        @partner.valid?
        expect(@partner.errors.full_messages).to include("Last name kana is invalid. Input full-width katakana characters")
      end
      it "first_name_kanaが空では登録できない" do
        @partner.first_name_kana = ""
        @partner.valid?
        expect(@partner.errors.full_messages).to include("First name kana can't be blank")
      end
      it "first_name_kanaが全角カタカナでなければ登録できない" do
        @partner.first_name_kana = "たろう"
        @partner.valid?
        expect(@partner.errors.full_messages).to include("First name kana is invalid. Input full-width katakana characters")
      end
      it "phone_numberが空では保存できない" do
        @partner.phone_number = ""
        @partner.valid?
        expect(@partner.errors.full_messages).to include("Phone number can't be blank")
      end
      it "phone_numberが10桁以上11桁以内でなければ保存できない" do
        @partner.phone_number = "123456789"
        @partner.valid?
        expect(@partner.errors.full_messages).to include("Phone number is too short")
      end
      it "phone_numberが半角数値以外では保存できない" do
        @partner.phone_number = "abcdefghijk"
        @partner.valid?
        expect(@partner.errors.full_messages).to include("Phone number is invalid. Input only numbers")
      end
    end
  end
end