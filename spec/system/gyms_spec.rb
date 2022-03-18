require 'rails_helper'

RSpec.describe 'ジム登録', type: :system do
  before do
    @admin = FactoryBot.create(:admin)
    @gym = FactoryBot.build(:gym)
  end
  context 'ジム登録ができるとき' do 
    it '正しい情報を入力すればジム登録できる' do
      # ログインする
      sign_in(@admin)
      # トップページにパートナー登録申込ページへ遷移するボタンがあることを確認する
      expect(page).to have_content('ADD NEW GYM')
      # ジム登録ページへ移動する
      visit new_gym_path
      # ジム情報を入力する
      image_path = Rails.root.join('public/images/test_image.png')
      attach_file('gym[image]',image_path, make_visible: true)
      fill_in '例) 〇〇クライミングジム', with: @gym.name
      select '北海道', from: 'gym[prefecture_id]'
      fill_in '例) 大阪市中央区', with: @gym.city_name
      fill_in '例) 本町1-1-1', with: @gym.street
      fill_in '例) https://bouldering-ability.com', with: @gym.gym_url
      # 登録するを押すとジムモデルのカウントが1上がることを確認する
      expect{
        click_on('登録する')
      }.to change { Gym.count }.by(1)
      # パートナー詳細ページに遷移していることを確認する
      expect(current_path).to eq(admin_path(@admin))
    end
  end

  context 'ジム登録ができないとき' do 
    it '誤った情報だと登録に失敗し、再びジム登録ページに戻ってくる' do
      # ログインする
      sign_in(@admin)
      # トップページにパートナー登録申込ページへ遷移するボタンがあることを確認する
      expect(page).to have_content('ADD NEW GYM')
      # ジム登録ページへ移動する
      visit new_gym_path
      # ジム情報を入力する
      fill_in '例) 〇〇クライミングジム', with: ''
      select '---', from: 'gym[prefecture_id]'
      fill_in '例) 大阪市中央区', with: ''
      fill_in '例) 本町1-1-1', with: ''
      fill_in '例) https://bouldering-ability.com', with: ''
      # 登録するを押すとジムモデルのカウントが上がらないことを確認する
      expect{
        click_on('登録する')
      }.to change { Gym.count }.by(0)
      # ジム登録ページへ戻されることを確認する
      expect(current_path).to eq(gyms_path)
    end
  end
end
