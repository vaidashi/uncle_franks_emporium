require 'rails_helper'

feature "When a visitor wants to checkout" do
  scenario "they don't see that option to checkout but login or create account" do
    item = create(:item)
    user = User.create(username: "Mac", password: "pattys")

    visit items_path

    click_on "Add to Cart"

    expect(page).to have_content("Successfully added")

    click_on "Cart"

    expect(current_path).to eq(cart_path)
    expect(page).to have_content(item.name)
    expect(page).to have_content("Quantity: 1")
    expect(page).to have_content(50.0)

    expect(page).to_not have_link("Checkout", exact: true)
    expect(page).to have_link("Login or Create Account to Checkout")
  end


  scenario "their cart retains the item once they are required to login/create account prior to checkout" do
    item = create(:item)
    user = User.create(username: "Mac", password: "pattys")

    visit items_path

    click_on "Add to Cart"

    click_on "Cart"
    expect(page).to have_content("Quantity: 1")
    expect(page).to have_link("Login or Create Account to Checkout")

    click_on "Login or Create Account to Checkout"
    expect(current_path).to eq(login_path)

    fill_in "session[username]", with: user.username
    fill_in "session[password]", with: user.password

    click_on "Log In"

    click_on "Cart"

    expect(page).to have_content("Quantity: 1")
    expect(page).to have_content(50.0)
    expect(page).to have_content(item.name)
    expect(page).to have_link("Checkout", exact: true)
    expect(page).to_not have_link("Login or Create Account to Checkout")
  end
end
