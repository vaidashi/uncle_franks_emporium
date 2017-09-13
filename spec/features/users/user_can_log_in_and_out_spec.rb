require 'rails_helper'

feature "user can login and out" do
  scenario "if already registered" do
    user = User.create(username: "Mac", password: "pattys")

    visit '/'

    click_on "Log In"

    expect(current_path).to eq(login_path)

    fill_in "session[username]", with: user.username
    fill_in "session[password]", with: user.password

    click_on "Log In"

    expect(current_path).to eq('/dashboard')
    expect(page).to have_content("Logged In as #{user.username}")
    expect(page).to_not have_link("Log In")
    expect(page).to have_link("Logout")


  end
end
