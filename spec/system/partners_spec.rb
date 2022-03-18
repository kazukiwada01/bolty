require 'rails_helper'

RSpec.describe 'パートナー登録申込', type: :system do
  before do
    @partner = FactoryBot.build(:partner)
  end
  context 'パートナー登録申込が送信できるとき' do 
    it '正しい情報を入力すれば確認画面に移動し、内容を確認後送信する' do
      # トップページに移動する
      visit root_path
      # トップページにパートナー登録申込ページへ遷移するボタンがあることを確認する
      expect(page).to have_content('PARTNERS')
      # パートナー登録申込ページへ移動する
      visit partners_new_path
      # 登録情報を入力する
      fill_in '会社名またはジム名', with: @partner.company
      fill_in 'name@example.com', with: @partner.email
      fill_in '例) 山田', with: @partner.last_name
      fill_in '例) 太郎', with: @partner.first_name
      fill_in '例) ヤマダ', with: @partner.last_name_kana
      fill_in '例) タロウ', with: @partner.first_name_kana
      fill_in '例）09012345678', with: @partner.phone_number
      # 確認画面に進むボタンをクリックする
      click_on('確認画面に進む')
      # 確認画面に遷移していることを確認する
      expect(current_path).to eq(partners_confirm_path)
      # 登録情報を入力する
      expect(page).to have_content(@partner.company)
      expect(page).to have_content(@partner.email)
      expect(page).to have_content(@partner.last_name)
      expect(page).to have_content(@partner.first_name)
      expect(page).to have_content(@partner.last_name_kana)
      expect(page).to have_content(@partner.first_name_kana)
      expect(page).to have_content(@partner.phone_number)
      # 送信するを押すとパートナーモデルのカウントが1上がることを確認する
      expect{
        click_on('送信する')
      }.to change { Partner.count }.by(1)
      # 送信完了ページに遷移していることを確認する
      expect(current_path).to eq(partners_done_path)
      # 送信完了ページにトップページへ遷移するボタンがあることを確認する
      expect(page).to have_content('トップページへ戻る')
    end
  end

  context 'パートナー登録申込が送信できないとき' do 
    it '誤った情報だと送信に失敗し、再びパートナー登録申込ページに戻ってくる' do
      # トップページに移動する
      visit root_path
      # トップページにパートナー登録申込ページへ遷移するボタンがあることを確認する
      expect(page).to have_content('PARTNERS')
      # パートナー登録申込ページへ移動する
      visit partners_new_path
      # 登録情報を入力する
      fill_in '会社名またはジム名', with: ''
      fill_in 'name@example.com', with: ''
      fill_in '例) 山田', with: ''
      fill_in '例) 太郎', with: ''
      fill_in '例) ヤマダ', with: ''
      fill_in '例) タロウ', with: ''
      fill_in '例）09012345678', with: ''
      # 確認画面に進むボタンをクリックする
      click_on('確認画面に進む')
      # パートナー登録申込ページに遷移していることを確認する
      expect(current_path).to eq(partners_confirm_path)
    end
  end
end