require 'rails_helper'

feature "from the items index and admin" do
  scenario "can click edit item and visit edit item page" do
    admin   = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    item1 = create(:item)
    item2 = create(:item)

    visit admin_items_path

    click_on "edit", :match => :first

    expect(current_path).to eq(edit_admin_item_path(item1))
    fill_in "item[name]", with: "NewGrossCouch"
    fill_in "item[description]", with: "changed description"
    fill_in "item[image_path]", with: "uncle_frank.jpg"
    # fill_in "item[active]", with: "false"

    click_on "Update"

    expect(current_path).to eq(item_path(item1))

    expect(page).to have_content("NewGrossCouch")
    expect(page).to have_content("changed description")
  end
end
