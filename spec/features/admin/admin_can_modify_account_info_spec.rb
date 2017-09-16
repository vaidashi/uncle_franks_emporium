require 'rails_helper'

feature "as a logged in admin" do
  scenario "I can modify my data" do
    admin   = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit '/admin/dashboard'

    click_on "Edit My Account"

    expect(current_path).to eq(edit_admin_user_path(admin))

    fill_in "user[username]", with: "Frankie"
    fill_in "user[name]", with: "Frankie"

    click_on "Update"

    expect(current_path).to eq(admin_dashboard_index_path)

    expect(User.last.id).to eq(admin.id)
    expect(User.last.name).to eq("Frankie")
  end

  scenario "I cant modify other user data" do

  end
end
