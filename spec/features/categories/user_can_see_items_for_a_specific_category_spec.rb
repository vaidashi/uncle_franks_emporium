
require 'rails_helper'

feature "visitor can view all items" do
  scenario "for a specific category by name" do
    category1 = create(:category_with_items)
    category2 = create(:category_with_items)

    visit "/#{category1.name}"

    expect(page).to have_content(category1.items[0].name)
    expect(page).to have_content(category1.items[1].name)
    expect(page).to_not have_content(category2.items[0].name)
    expect(page).to_not have_content(category2.items[1].name)

    visit "/#{category2.name}"

    expect(page).to have_content(category2.items[0].name)
    expect(page).to have_content(category2.items[1].name)
    expect(page).to_not have_content(category1.items[0].name)
    expect(page).to_not have_content(category1.items[1].name)
  end
end
