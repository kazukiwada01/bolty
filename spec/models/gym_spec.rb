require 'rails_helper'

RSpec.describe Gym, type: :model do
  before do
    @gym = FactoryBot.build(:gym)
  end

  describe 'ジム登録' do
    context 'ジムが登録できる場合' do
      it '条件通り全ての項目に値が存在すれば登録できる' do
        expect(@gym).to be_valid
      end
      it 'bilding_nameは空でも登録できる' do
        @gym.building_name = ''
        expect(@gym).to be_valid
      end
    end

    context 'ジムが登録できない場合' do
      it 'imageが空では登録できない' do
        @gym.image = nil
        @gym.valid?
        expect(@gym.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空では登録できない' do
        @gym.name = ''
        @gym.valid?
        expect(@gym.errors.full_messages).to include("Name can't be blank")
      end
      it 'prefecture_idが空では登録できない' do
        @gym.prefecture_id = 1
        @gym.valid?
        expect(@gym.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'city_nameが空では登録できない' do
        @gym.city_name = ''
        @gym.valid?
        expect(@gym.errors.full_messages).to include("City name can't be blank")
      end
      it 'streetが空では登録できない' do
        @gym.street = ''
        @gym.valid?
        expect(@gym.errors.full_messages).to include("Street can't be blank")
      end
      it 'gym_urlが空では登録できない' do
        @gym.gym_url = ''
        @gym.valid?
        expect(@gym.errors.full_messages).to include("Gym url can't be blank")
      end
      it 'gym_urlが正常でなければ登録できない' do
        @gym.gym_url = 'www.com'
        @gym.valid?
        expect(@gym.errors.full_messages).to include('Gym url is invalid')
      end
      it 'adminが紐づいていないと保存できない' do
        @gym.admin = nil
        @gym.valid?
        expect(@gym.errors.full_messages).to include('Admin must exist')
      end
    end
  end
end
