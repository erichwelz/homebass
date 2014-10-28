def login_user
  visit login_path
  within('#login') { fill_in "Email", with: user.email }
  fill_in "Password", with: user.password
  click_button "Login"
end