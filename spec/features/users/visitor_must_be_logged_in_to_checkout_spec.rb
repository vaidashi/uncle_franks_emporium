require 'rails_helper'

feature "visitor can create account" do
  scenario "visitor can create an account and check out" do
    item = create(:item)

    visit '/items'

    click_on "Add to Cart"

    click_on "shopping_cart"

    expect(page).to have_button("To checkout login or create an account")

    click_on "To checkout login or create an account"

    click_on("Create Account", :match => :first)

    fill_in "user[username]", with: "Charlie"
    fill_in "user[password]", with: "I love the waitress"
    fill_in "user[password_confirmation]", with: "I love the waitress"

    click_on "Create Account"

    click_on "shopping_cart"

    click_on "Checkout"


    order_item = User.first.orders.first.items.first
    user_orders = User.first.orders
    user_order = User.first.orders.first

    expect(current_path).to eq(orders_path)
    expect(user_orders.count).to eq(1)
    expect(page).to have_content("Order was successfully placed")
    expect(page).to have_link(user_order.id)
  end
  scenario "user can't check out with an empty cart" do
    visit '/'

    click_on "shopping_cart"

    expect(page).to have_button("To checkout login or create an account")

    click_on "To checkout login or create an account"

    click_on("Create Account", :match => :first)

    fill_in "user[username]", with: "Charlie"
    fill_in "user[password]", with: "I love the waitress"
    fill_in "user[password_confirmation]", with: "I love the waitress"

    click_on "Create Account"

    click_on "shopping_cart"

    click_on "Checkout"

    expect(page).to have_content("CART EMPTY FILL IT WITH GARBAGE")
  end
end
