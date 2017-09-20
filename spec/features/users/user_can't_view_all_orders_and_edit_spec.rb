require 'rails_helper'

feature "as a logged in user" do
  scenario "I can't edit an order status by visiting admin dashboard" do
    user = create(:user)
    user = create(:user_with_orders)

    user.orders.each do |order|
      order.items << create_list(:item, 3)
    end


    allow_any_instance_of(ApplicationController).to receive(
    :current_user).and_return(user)

    visit '/admin/dashboard'

    expect(page).to have_content("The page you were looking for doesn't exist")
  end
end
