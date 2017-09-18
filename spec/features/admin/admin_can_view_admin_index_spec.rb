require 'rails_helper'

feature "from the admin dashboard" do
  scenario "they can click all items and visit item index" do
    admin   = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    item1 = create(:item)
    item2 = create(:item)

    visit 'admin/dashboard'

    click_on "All Items"

    expect(current_path).to eq("/admin/items")
    

    expect(page).to have_content(item1.name)
    expect(page).to have_content(item2.name)

    expect(page).to have_content(item1.description)
    expect(page).to have_content(item2.description)

    expect(page).to have_button("Edit")
  end
end
