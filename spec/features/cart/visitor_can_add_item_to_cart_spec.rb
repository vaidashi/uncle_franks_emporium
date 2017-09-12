require "rails_helper"

feature "When a visitor adds an item to their cart" do
  scenario "they are notified they added an item" do
    create(:item)
    visit items_path

    click_on "Add to Cart"

    expect(page).to have_content("Successfully added")
  end

  scenario "and they can view the cart" do
    item = create(:item)
    total_price = item.price * 2
    visit item_path(item)

    click_on "Add to Cart"
    click_on "Add to Cart"

    click_on "Cart"

    expect(current_path).to eq(cart_path)
    expect(page).to have_content(item.name)
    expect(page).to have_content(item.description)
    expect(page).to have_content(item.price)
    expect(page).to have_content(item.image_path)
    expect(page).to have_content(total_price)

  end

end
