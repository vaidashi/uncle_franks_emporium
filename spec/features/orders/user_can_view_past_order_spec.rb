require 'rails_helper'

feature 'as a user when I visit /orders' do
  scenario 'I can click on an individual past order' do
    user   = create(:user_with_orders)

    user.orders.each do |order|
      order.items << create_list(:item, 3)
    end

    visit '/'

    click_on("Login")

    fill_in "session[username]", with: user.username
    fill_in "session[password]", with: user.password
    click_on("Log In")

    visit '/orders'

    click_on ("Order: #{user.orders.first.id}")
    expect(current_path).to eq(order_path(user.orders.first))

    expect(page).to have_content(user.orders.first.items.first.name)
    expect(page).to have_content(user.orders.first.items.second.name)
    expect(page).to have_content(user.orders.first.items.third.name)
    expect(page).to have_content(user.orders.first.status.humanize)
    # expect(page).to have_content("$150.00")
    expect(page).to have_content("$50.00")
    expect(page).to have_content(user.orders.first.created_at.to_formatted_s(:long_ordinal))
  end
end
