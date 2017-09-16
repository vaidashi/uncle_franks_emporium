require 'rails_helper'

feature "as a logged in admin" do
  scenario "they are redirected to the admin dashboard after they log in" do
    admin   = create(:user, role: 1)

    visit '/'

    click_on("Login")

    expect(current_path).to eq(root_path)

    fill_in "session[username]", with: admin.username
    fill_in "session[password]", with: admin.password

    click_on("Log In")

    expect(current_path).to eq('/admin/dashboard')

    expect(page).to have_content("Admin Dashboard")
  end
  
feature "as a logged in non-admin user" do
  scenario "they cannot visit the admin dashboard" do
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/admin/dashboard"

    expect(page).to have_content("The page you were looking for doesn't exist")
   end
  end

  feature "as an unregistered user" do
    scenario "they cannot visit the admin dashboard" do
      user = create(:user)

      visit "/admin/dashboard"

      expect(page).to have_content("The page you were looking for doesn't exist")
   end
  end
end
