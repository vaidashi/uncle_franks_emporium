require 'rails_helper'

feature "as a logged in user" do
  scenario "I can modify my data" do
    user   = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/dashboard'

    click_on "Edit My Account"

    expect(current_path).to eq(edit_user_path(user))

    fill_in "user[username]", with: "Frankie"
    fill_in "user[name]", with: "Frankie"

    click_on "Update"

    expect(current_path).to eq(dashboard_path)

    expect(User.last.id).to eq(user.id)
    expect(User.last.username).to eq("Frankie")
    expect(page).to have_content("Successfully Updated Account")
  end

  scenario "I cant modify other user data" do
    user1   = create(:user)
    user2  = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)

    visit "/users/#{user2.id}/edit"

    expect(page).to have_content("The page you were looking for doesn't exist")
  end


end
