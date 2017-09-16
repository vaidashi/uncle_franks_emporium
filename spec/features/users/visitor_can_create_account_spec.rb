require 'rails_helper'

feature "visitor can create account" do
  scenario "from login page" do
    visit '/'

    click_on "Login"

    click_on(id: 'create_link')

    within('.new_user') do
      fill_in "user[username]", with: "Charlie"
      fill_in "user[password]", with: "I love the waitress"
      fill_in "user[password_confirmation]", with: "I love the waitress"
    end

    click_on(id: "create_form")

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Logged in as: Charlie")
    expect(page).to_not have_link("Log In")
    expect(page).to have_link("Logout")
  end
  scenario "user creates an invalid account and is redirected to the create page" do
    visit '/'

    click_on "Login"

    click_on(id: 'create_link')

    fill_in "user[username]", with: ""
    fill_in "user[password]", with: ""
    fill_in "user[password_confirmation]", with: "dd"

    click_on(id: "create_form")

    expect(current_path).to_not eq(dashboard_path)
  end
end
