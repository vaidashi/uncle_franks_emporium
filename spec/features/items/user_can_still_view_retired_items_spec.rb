require 'rails_helper'

feature "visitor can view all items" do
  scenario "vistor visits /items route" do
    item1 = create(:item, active: false)

    visit item_path(item1)

    expect(page).to_not have_button('Add to Cart')
    expect(page).to have_button('Item Retired')
  end
end
