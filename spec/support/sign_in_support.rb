module SignInSupport
  def sign_in(admin)
    visit admin_session_path
    fill_in 'Email address', with: admin.email
    fill_in 'Password(6文字以上の半角英数字)', with: admin.password
    click_on('Log in')
    expect(current_path).to eq(admin_path(admin))
  end
end