require 'rails_helper'

feature "visitor can create account" do
  scenario "from login page" do
    visit '/'

    click_on "Log In"

    expect(page).to have_link("Create Account")

    click_on "Create Account"

    expect(current_path).to eq(new_user_path)

    fill_in "user[username]", with: "Charlie"
    fill_in "user[password]", with: "I love the waitress"
    fill_in "user[password_confirmation]", with: "I love the waitress"

    click_on "Create Account"

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Logged In as Charlie")
    expect(page).to_not have_link("Log In")
    expect(page).to have_link("Logout")
  end
end
