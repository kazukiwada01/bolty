require 'rails_helper'

RSpec.describe ProblemList, type: :model do
  before do
    @problem_list = FactoryBot.build(:problem_list)
  end

  describe '課題帳登録' do
    context '課題帳が作成できる場合' do
      it '条件通り全ての項目に値が存在すれば作成できる' do
        expect(@problem_list).to be_valid
      end
    end

    context '課題帳が作成できない場合' do
      it 'nameが空では登録できない' do
        @problem_list.name = ''
        @problem_list.valid?
        expect(@problem_list.errors.full_messages).to include("Name can't be blank")
      end
      it 'adminが紐づいていないと保存できない' do
        @problem_list.admin = nil
        @problem_list.valid?
        expect(@problem_list.errors.full_messages).to include('Admin must exist')
      end
      it 'gymが紐づいていないと保存できない' do
        @problem_list.gym = nil
        @problem_list.valid?
        expect(@problem_list.errors.full_messages).to include('Gym must exist')
      end
    end
  end
end
