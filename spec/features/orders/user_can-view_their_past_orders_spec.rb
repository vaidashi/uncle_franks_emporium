require 'rails_helper'

feature 'as a user when I visit /orders' do
  scenario 'I see all orders belong to me and no other orders' do
    user   = User.create(username: "Mac", password: "pattys")
    dee    = User.create(username: "Dee", password: "birdy")

    order1 = Order.create(user_id: user.id)
    order2 = Order.create(user_id: user.id)
    order3 = Order.create(user_id: dee.id)

    visit '/'

    click_on("Login")

    fill_in "session[username]", with: user.username
    fill_in "session[password]", with: user.password
    click_on("Log In")

    visit '/orders'

    expect(page).to have_link(order1.id)
    expect(page).to have_link(order2.id)
    expect(page).to_not have_link(order3.id)
  end

end
