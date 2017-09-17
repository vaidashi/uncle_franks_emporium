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

    expect(page).to have_link("Order: #{user1.orders.first.id}")
    expect(page).to have_link("Order: #{user2.orders.first.id}")
    expect(page).to have_content("Ordered: 6")
    expect(page).to have_content("Cancelled: 1")
    expect(page).to have_content("Paid: 1")
    expect(page).to have_content("Completed: 1")
  end

  scenario "I can filter the orders on the dashboard page" do
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

    visit admin_dashboard_index_path(order_status: "cancelled")

    select "cancelled", :from => "order_status"

    expect(page).to_not have_content("Order: #{user1.orders.first.id}")
    expect(page).to_not have_content("Order: #{user2.orders.second.id}")
    expect(page).to have_content("Order: #{user1.orders.last.id}")
  end

  scenario "I can change the status of the order" do
    admin   = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    user = create(:user)
    order1 = Order.create(user: user, status: "paid")
    order2 = Order.create(user: user)
    order3 = Order.create(user: user)

    visit admin_dashboard_index_path

    expect(page).to have_button("Cancel")
    expect(page).to have_button("Mark as Paid")
    expect(page).to have_button("Mark as Completed")

    within(".order#{order1.id}") do
      click_on "Mark as Completed"
    end

    expect(Order.find(order1.id).status).to eq("completed")

    within(".order#{order2.id}") do
      click_on "Cancel"
    end

    expect(Order.find(order2.id).status).to eq("cancelled")

    within(".order#{order3.id}") do
      click_on "Mark as Paid"
    end

    expect(Order.find(order3.id).status).to eq("paid")

    within(".order#{order3.id}") do
      click_on "Cancel"
    end

    expect(Order.find(order3.id).status).to eq("cancelled")
  end


end
