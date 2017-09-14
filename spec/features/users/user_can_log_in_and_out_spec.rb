require 'rails_helper'

feature "user can login and out" do
  scenario "if already registered" do
    user = User.create(username: "Mac", password: "pattys")

    visit '/'

    click_on("Login")

    expect(current_path).to eq(root_path)

    fill_in "session[username]", with: user.username
    fill_in "session[password]", with: user.password

    click_on("Log In")

    expect(current_path).to eq('/dashboard')
    expect(page).to have_content("Logged In as #{user.username}")
    expect(page).to_not have_link("Login")
    expect(page).to have_link("Logout")

    click_on "Logout"
    expect(current_path).to eq(root_path)
    expect(page).to_not have_link("Logout")
    expect(page).to have_content("Login")
  end
  scenario "if a user enters invalid credentials" do
    visit '/'

    click_on("Login")

    expect(current_path).to eq(root_path)

    fill_in "session[username]", with: "invalid_username"
    fill_in "session[password]", with: "invalid_password"

    click_on("Log In")

    expect(page).to have_content("Login Unsuccessful")
  end
end
