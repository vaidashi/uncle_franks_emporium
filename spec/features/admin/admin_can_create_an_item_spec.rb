require 'rails_helper'

feature "from the items index" do
  scenario "an admin can create an item" do
    admin   = create(:user, role: 1)
    category = create(:category)

    allow_any_instance_of(ApplicationController).to receive(
    :current_user).and_return(admin)

    visit admin_items_path

    click_on("Create a New Item")

    expect(current_path).to eq(new_admin_item_path)
    fill_in "item[name]", with: "NewGrossCouch"
    fill_in "item[description]", with: "Newdescription"
    fill_in "item[price]", with: 100.0

    page.select "#{category.name}", :from => "item_category_id"
    fill_in "item[image_path]", with: "uncle_frank.jpg"
    click_on("Create")

    expect(current_path).to eq(item_path(Item.first))
    expect(Item.count).to eq(1)
    expect(page).to have_content("NewGrossCouch")
  end

  scenario "an admin can create an item without specifying image" do
    Item.destroy_all
    admin   = create(:user, role: 1)
    category = create(:category)

    allow_any_instance_of(ApplicationController).to receive(
    :current_user).and_return(admin)

    visit admin_items_path

    click_on("Create a New Item")

    expect(current_path).to eq(new_admin_item_path)
    fill_in "item[name]", with: "NewGrossCouch"
    fill_in "item[description]", with: "Newdescription"
    fill_in "item[price]", with: 100.0

    page.select "#{category.name}", :from => "item_category_id"
    click_on("Create")

    expect(current_path).to eq(item_path(Item.first))
    expect(Item.count).to eq(1)
    expect(page).to have_content("NewGrossCouch")
    expect(Item.first.image_path).to eq("garbage.jpg")
  end

  scenario "an admin can't create an item without a unique name" do
    admin    = create(:user, role: 1)
    category = create(:category)
    item     = Item.create(name: "NewGrossCouch", description: "TheThing", image_path: "garbage.jpg", price: 77, category: category)

    allow_any_instance_of(ApplicationController).to receive(
    :current_user).and_return(admin)

    visit admin_items_path

    click_on("Create a New Item")

    expect(current_path).to eq(new_admin_item_path)
    fill_in "item[name]", with: "NewGrossCouch"
    fill_in "item[description]", with: "Newdescription"
    fill_in "item[price]", with: 100.0

    page.select "#{category.name}", :from => "item_category_id"
    click_on("Create")

    expect(current_path).to eq(new_admin_item_path)
    expect(Item.count).to eq(1)
    expect(page).to have_content("Creation failed")
  end
end
