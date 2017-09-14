require "rails_helper"

feature "When a visitor adds an item to their cart and visits their cart" do

  scenario "and they can remove an item from their cart and they can visit the page for the item they deleted" do
    item = create(:item)
    visit item_path(item)

    click_on "Add to Cart"

    click_on "shopping_cart"

    click_on "delete"

    expect(page).to have_content("Successfully removed #{item.name}")
    expect(current_path).to eq(cart_path)
    expect(page).to_not have_content(item.description)
    expect(page).to_not have_content("$50.00")
    expect(page).to_not have_content(item.image_path)
    expect(page).to have_link(item.name)

    click_on item.name

    expect(current_path).to eq(item_path(item))

    click_on "shopping_cart"

    expect(page).to_not have_content(item.description)
    expect(page).to_not have_content(item.price)
    expect(page).to_not have_content(item.image_path)
  end
end
