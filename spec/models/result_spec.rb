require 'rails_helper'

RSpec.describe Result, type: :model do
  before do
    user = FactoryBot.create(:user)
    gym = FactoryBot.create(:gym)
    problem = FactoryBot.create(:problem)
    @result = FactoryBot.build(:result, user_id: user.id, gym_id: gym.id, problem_id: problem.id)
    sleep 0.1
  end

  describe '課題登録' do
    context '登録できる場合' do
      it '条件通り全ての項目に値が存在すれば登録できる' do
        expect(@result).to be_valid
      end
    end

    context '登録できない場合' do
      it 'climbが空では登録できない' do
        @result.climb = ''
        @result.valid?
        expect(@result.errors.full_messages).to include("Climb can't be blank")
      end
      it 'holdingが空では登録できない' do
        @result.holding = ''
        @result.valid?
        expect(@result.errors.full_messages).to include("Holding can't be blank")
      end
      it 'physicalが空では登録できない' do
        @result.physical = ''
        @result.valid?
        expect(@result.errors.full_messages).to include("Physical can't be blank")
      end
      it 'moveが空では登録できない' do
        @result.move = ''
        @result.valid?
        expect(@result.errors.full_messages).to include("Move can't be blank")
      end
      it 'positioningが空では登録できない' do
        @result.positioning = ''
        @result.valid?
        expect(@result.errors.full_messages).to include("Positioning can't be blank")
      end
      it 'footworkが空では登録できない' do
        @result.footwork = ''
        @result.valid?
        expect(@result.errors.full_messages).to include("Footwork can't be blank")
      end
      it 'coordinationが空では登録できない' do
        @result.coordination = ''
        @result.valid?
        expect(@result.errors.full_messages).to include("Coordination can't be blank")
      end
      it 'userが紐づいていないと保存できない' do
        @result.user = nil
        @result.valid?
        expect(@result.errors.full_messages).to include('User must exist')
      end
      it 'gymが紐づいていないと保存できない' do
        @result.gym = nil
        @result.valid?
        expect(@result.errors.full_messages).to include('Gym must exist')
      end
      it 'problemが紐づいていないと保存できない' do
        @result.problem = nil
        @result.valid?
        expect(@result.errors.full_messages).to include('Problem must exist')
      end
    end
  end
end
