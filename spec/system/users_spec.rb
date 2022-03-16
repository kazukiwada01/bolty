require 'rails_helper'

RSpec.describe 'ユーザー新規登録', type: :system do
  before do
    @user = FactoryBot.build(:user)
  end
  context 'ユーザー新規登録ができるとき' do 
    it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
      # トップページに移動する
      visit root_path
      # トップページにサインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_content('SIGN UP')
      # 新規登録ページへ移動する
      visit new_user_registration_path
      # ユーザー情報を入力する
      fill_in 'Nickname', with: @user.nickname
      fill_in 'Email address', with: @user.email
      fill_in 'Password(6文字以上の半角英数字)', with: @user.password
      fill_in 'Password(同じパスワードを入力して下さい)', with: @user.password_confirmation
      # サインアップボタンを押すとユーザーモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { User.count }.by(1)
      # トップページへ遷移したことを確認する
      expect(current_path).to eq(root_path)
      # ログアウトボタン,マイページボタンが表示されることを確認する
      expect(page).to have_content('LOG OUT')
      expect(page).to have_content('MY PAGE')
      # サインアップページへ遷移するボタンや、ログインページへ遷移するボタンが表示されていないことを確認する
      expect(page).to have_no_content('SIGN UP')
      expect(page).to have_no_content('LOG IN')
    end
  end

  context 'ユーザー新規登録ができないとき' do
    it '誤った情報ではユーザー新規登録ができずに新規登録ページへ戻ってくる' do
      # トップページに移動する
      visit root_path
      # トップページにサインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_content('SIGN UP')
      # 新規登録ページへ移動する
      visit new_user_registration_path
      # ユーザー情報を入力する
      fill_in 'Nickname', with: ''
      fill_in 'Email address', with: ''
      fill_in 'Password(6文字以上の半角英数字)', with: ''
      fill_in 'Password(同じパスワードを入力して下さい)', with: ''
      # サインアップボタンを押してもユーザーモデルのカウントは上がらないことを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { User.count }.by(0)
      # 新規登録ページへ戻されることを確認する
      expect(current_path).to eq user_registration_path
    end
  end
end

RSpec.describe 'ユーザーログイン機能', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end
  context 'ユーザーログインができるとき' do
    it '正しい情報を入力すればユーザーログインに成功し、トップページに遷移する' do
      # トップページに移動する
      visit root_path
      # トップページにサインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_content('LOG IN')
      # ログインページへ移動する
      visit user_session_path
      # すでに保存されているユーザーのemailとpasswordを入力する
      fill_in 'Email address', with: @user.email
      fill_in 'Password(6文字以上の半角英数字)', with: @user.password
      # ログインボタンをクリックする
      click_on('Log in')
      # トップページに遷移していることを確認する
      expect(current_path).to eq(root_path)
    end
  end

  context 'ユーザーログインができないとき' do 
    it '誤った情報だとログインに失敗し、再びログインページに戻ってくる' do
      # トップページに移動する
      visit root_path
      # トップページにログインページへ遷移するボタンがあることを確認する
      expect(page).to have_content('LOG IN')
      # ログインページへ移動する
      visit user_session_path
      # 誤ったユーザー情報を入力する
      fill_in 'Email address', with: ''
      fill_in 'Password(6文字以上の半角英数字)', with: ''
      # ログインボタンをクリックする
      click_on('Log in')
      # ログインページへ戻されることを確認する
      expect(current_path).to eq(user_session_path)
    end
  end
end
