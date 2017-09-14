require "rails_helper"

feature "When a visitor adds an item to their cart and visits their cart" do

  scenario "and they can increase the quantity of an item in their cart" do
    item = create(:item)

    visit item_path(item)

    click_on "Add to Cart"

    click_on "Cart"

    expect(page).to have_content("1")
    expect(page).to have_content(50.0)

    click_on "add_shopping_cart"

    expect(page).to have_content("Successfully added a #{item.name}")
    expect(current_path).to eq(cart_path)
    expect(page).to have_content("2")
    expect(page).to have_content(100.0)
  end
end
