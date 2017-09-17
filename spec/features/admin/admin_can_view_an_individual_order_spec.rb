require 'rails_helper'

feature "as a logged in admin" do
  scenario "I can view an individual order" do
    admin   = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    user1   = create(:user_with_orders)

    user1.orders.each do |order|
      order.items << create_list(:item, 3)
    end

    visit '/admin/dashboard'

    click_on "#{user1.orders.first.id}"

    expect(page).to have_content(user1.name)
    expect(page).to have_content(user1.address)
    expect(page).to have_content(user1.orders.first.created_at)
    expect(page).to have_link(user1.orders.first.items.first.name)
    expect(page).to have_content(user1.orders.first.items.count)
    expect(page).to have_content(user1.orders.first.items.first.price)
    expect(page).to have_content(user1.orders.first.items.second.price)
    expect(page).to have_content(user1.orders.first.items.third.price)
    expect(page).to have_content("$150.00")
    expect(page).to have_content("$50.00")
    expect(page).to have_content(user1.orders.first.status)
  end
end
