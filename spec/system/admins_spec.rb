require 'rails_helper'

RSpec.describe 'パートナーログイン機能', type: :system do
  before do
    @admin = FactoryBot.create(:admin)
  end
  context 'パートナーログインができるとき' do
    it '正しい情報を入力すればログインに成功し、パートナー詳細ページに遷移する' do
      # トップページに移動する
      visit root_path
      # トップページにパートナー登録申込ページへ遷移するボタンがあることを確認する
      expect(page).to have_content('PARTNERS')
      # パートナー登録申込ページへ移動する
      visit partners_new_path
      # パートナー登録申込ページにパートナーログインページへ遷移するボタンがあることを確認する
      expect(page).to have_content('PARTNERS LOG IN')
      # パートナーログインページへ移動する
      visit admin_session_path
      # すでに保存されているパートナーのemailとpasswordを入力する
      fill_in 'Email address', with: @admin.email
      fill_in 'Password(6文字以上の半角英数字)', with: @admin.password
      # ログインボタンをクリックする
      click_on('Log in')
      # パートナー詳細ページに遷移していることを確認する
      expect(current_path).to eq(admin_path(@admin))
    end
  end

  context 'パートナーログインができないとき' do
    it '誤った情報だとログインに失敗し、再びログインページに戻ってくる' do
      # トップページに移動する
      visit root_path
      # トップページにパートナー登録申込ページへ遷移するボタンがあることを確認する
      expect(page).to have_content('PARTNERS')
      # パートナー登録申込ページへ移動する
      visit partners_new_path
      # パートナー登録申込ページにパートナーログインページへ遷移するボタンがあることを確認する
      expect(page).to have_content('PARTNERS LOG IN')
      # パートナーログインページへ移動する
      visit admin_session_path
      # すでに保存されているパートナーのemailとpasswordを入力する
      fill_in 'Email address', with: ''
      fill_in 'Password(6文字以上の半角英数字)', with: ''
      # ログインボタンをクリックする
      click_on('Log in')
      # ログインページへ戻されることを確認する
      expect(current_path).to eq(admin_session_path)
    end
  end
end