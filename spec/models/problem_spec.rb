require 'rails_helper'

RSpec.describe Problem, type: :model do
  before do
    problem_list = FactoryBot.create(:problem_list)
    admin = FactoryBot.create(:admin)
    @problem = FactoryBot.build(:problem, admin_id: admin.id, problem_list_id: problem_list.id)
    sleep 0.1
  end

  describe '課題登録' do
    context '課題が登録できる場合' do
      it '条件通り全ての項目に値が存在すれば登録できる' do
        expect(@problem).to be_valid
      end
    end

    context '課題が登録できない場合' do
      it 'nameが空では登録できない' do
        @problem.name = ''
        @problem.valid?
        expect(@problem.errors.full_messages).to include("Name can't be blank")
      end
      it 'grade_idが空では登録できない' do
        @problem.grade_id = 1
        @problem.valid?
        expect(@problem.errors.full_messages).to include("Grade can't be blank")
      end
      it 'holdingが空では登録できない' do
        @problem.holding = ''
        @problem.valid?
        expect(@problem.errors.full_messages).to include("Holding can't be blank")
      end
      it 'physicalが空では登録できない' do
        @problem.physical = ''
        @problem.valid?
        expect(@problem.errors.full_messages).to include("Physical can't be blank")
      end
      it 'moveが空では登録できない' do
        @problem.move = ''
        @problem.valid?
        expect(@problem.errors.full_messages).to include("Move can't be blank")
      end
      it 'positioningが空では登録できない' do
        @problem.positioning = ''
        @problem.valid?
        expect(@problem.errors.full_messages).to include("Positioning can't be blank")
      end
      it 'footworkが空では登録できない' do
        @problem.footwork = ''
        @problem.valid?
        expect(@problem.errors.full_messages).to include("Footwork can't be blank")
      end
      it 'coordinationが空では登録できない' do
        @problem.coordination = ''
        @problem.valid?
        expect(@problem.errors.full_messages).to include("Coordination can't be blank")
      end
      it 'adminが紐づいていないと保存できない' do
        @problem.admin = nil
        @problem.valid?
        expect(@problem.errors.full_messages).to include('Admin must exist')
      end
      it 'problem_listが紐づいていないと保存できない' do
        @problem.problem_list_id = nil
        @problem.valid?
        expect(@problem.errors.full_messages).to include('Problem list must exist')
      end
    end
  end
end
