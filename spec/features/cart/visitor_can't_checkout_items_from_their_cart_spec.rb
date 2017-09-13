require 'rails_helper'

feature "When a visitor wants to checkout" do
  scenario "they don't see that option to checkout but login or create account" do
    item = create(:item)
    visit items_path

    click_on "Add to Cart"

    expect(page).to have_content("Successfully added")

    click_on "Cart"

    expect(current_path).to eq(cart_path)
    expect(page).to have_content(item.name)
    expect(page).to_not have_link("Checkout", exact: true)
    expect(page).to have_link("Login or Create Account to Checkout")
  end
end
