require 'rails_helper'

feature "from the items index" do
  scenario "a default user can't edit an item" do
    user = create(:user)
    item = create(:item)

    allow_any_instance_of(ApplicationController).to receive(
    :current_user).and_return(user)

    visit edit_admin_item_path(item)

    expect(page).to have_content("The page you were looking for doesn't exist")
  end
end
