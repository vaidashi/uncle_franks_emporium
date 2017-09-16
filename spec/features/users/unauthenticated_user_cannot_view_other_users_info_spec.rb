require 'rails_helper'

feature "as a logged in user" do
  scenario "they can only view their own orders" do
    user1   = create(:user_with_orders)

    user1.orders.each do |order|
      order.items << create_list(:item, 3)
    end

    visit "/orders"

    expect(page).to have_content("The page you were looking for doesn't exist")

    visit "/orders/#{user1.orders.first.id}"

    expect(page).to have_content("The page you were looking for doesn't exist")
  end
end
