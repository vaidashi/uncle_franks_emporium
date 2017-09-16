require 'rails_helper'

feature "as a logged in admin" do
  scenario "I can view orders on the dashboard" do
    admin   = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    user1   = create(:user_with_orders)

    user1.orders.each do |order|
      order.items << create_list(:item, 3)
    end

    user2   = create(:user_with_orders)

    user2.orders.each do |order|
      order.items << create_list(:item, 3)
    end

    user1.orders.create(status: "cancelled")
    user2.orders.create(status: "completed")
    user2.orders.create(status: "paid")



    visit '/admin/dashboard'

    expect(page).to have_link(user1.orders.first.id)
    expect(page).to have_link(user2.orders.first.id)
    expect(page).to have_content("Ordered: 6")
    expect(page).to have_content("Cancelled: 1")
    expect(page).to have_content("Paid: 1")
    expect(page).to have_content("Completed: 1")
  end


end
