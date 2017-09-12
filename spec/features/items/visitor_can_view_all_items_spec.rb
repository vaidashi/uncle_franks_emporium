require 'rails_helper'

feature "visitor can view all items" do
  scenario "vistor visits /items route" do
    item1 = create(:item)
    item2 = create(:item)
    visit items_path

    expect(page).to have_content(item1.name)
    expect(page).to have_content(item2.name)

    expect(page).to have_content(item1.price)
    expect(page).to have_content(item2.price)

    expect(page).to have_css(".itemimage")
  end
end
