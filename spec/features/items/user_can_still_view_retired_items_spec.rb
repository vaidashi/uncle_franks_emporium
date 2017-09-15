require 'rails_helper'

feature "visitor can view all items" do
  scenario "vistor visits /items route" do
    item1 = create(:item, active: false)
    item2 = create(:item, active: false)

    visit items_path

    expect(page).to have_content(item1.name)
    expect(page).to have_content(item2.name)

    expect(page).to have_content(item1.description)
    expect(page).to have_content(item2.description)

    expect(page).to not_have_content('Add item to cart')
    expect(page).to have_content('Item Retired')
  end
end
