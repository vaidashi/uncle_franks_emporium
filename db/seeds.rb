# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Item.destroy_all
Category.destroy_all
Order.destroy_all
User.destroy_all
ItemOrder.destroy_all

CATEGORIES = ["Bath", "Furniture", "Kitchen", "Mattresses", "Seasonal"]

CATEGORIES.each do |category|
  created = Category.create(name: category)
  puts "Created #{created.name} category."
end

# -----------------------------Furniture
puts "Creating Furniture Items"
Item.create(name: "Reduced Height Couch", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Furniture"), image_path: "furniture1.png")
Item.create(name: "Pallet Chic Backyard Set", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Furniture"), image_path: "furniture2.png")
Item.create(name: "Distressed Beach Couch", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Furniture"), image_path: "furniture3.png")
Item.create(name: "Antique Entertainment Center", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Furniture"), image_path: "furniture4.png")
Item.create(name: "Shabby Chic Retro Sofa", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Furniture"), image_path: "furniture5.png")
Item.create(name: "Extended Storage Sofa", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Furniture"), image_path: "furniture6.png")
Item.create(name: "Dual Tone Distressed Deconstructed Couch", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Furniture"), image_path: "furniture7.png", active: false)
Item.create(name: "Overstuffed Deconstruced Couch", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Furniture"), image_path: "furniture8.png")
Item.create(name: "Floral Pattern Yard Sofa", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Furniture"), image_path: "furniture9.png", active: false)
Item.create(name: "Wasteland Chic Chaise", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Furniture"), image_path: "furniture10.png")
Item.create(name: "Shabby Chic Deconstructed Couch", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Furniture"), image_path: "furniture11.png")
Item.create(name: "Distressed Dual Tone Leather Sofa", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Furniture"), image_path: "furniture12.png")

# -----------------------------Kitchen
puts "Creating Kitchen Items"
Item.create(name: "Wasteland Chic Fridge", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Kitchen"), image_path: "kitchen1.jpg")
Item.create(name: "Pre-weathered Deluxe Microwave", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Kitchen"), image_path: "kitchen2.jpg")
Item.create(name: "Yard Microwave", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Kitchen"), image_path: "kitchen3.jpg")
Item.create(name: "Deluxe Toaster with Toast Extraction Tool", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Kitchen"), image_path: "kitchen4.jpg", active: false)
Item.create(name: "Shabby Chic Microwave", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Kitchen"), image_path: "kitchen5.jpg")
Item.create(name: "Deluxe 'Probably an Oven'", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Kitchen"), image_path: "kitchen6.jpg")
Item.create(name: "Rust Based Pan", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Kitchen"), image_path: "kitchen7.jpg")


# -----------------------------Seasonal
puts "Creating Seasonal Items"
Item.create(name: "Possibly a Christmas Tree", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Seasonal"), image_path: "seasonal1.jpg")
Item.create(name: "Artesinal Jack 'O Lantern", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Seasonal"), image_path: "seasonal2.jpg")
Item.create(name: "Portable Christmas Tree", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Seasonal"), image_path: "seasonal3.jpg")
Item.create(name: "Aged Handcrafted Carved Pumpkin", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Seasonal"), image_path: "seasonal4.jpg")
Item.create(name: "Ornaments Assortment", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Seasonal"), image_path: "seasonal5.jpg")
Item.create(name: "Pre-Lit Fireworks", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Seasonal"), image_path: "seasonal6.jpg")
Item.create(name: "Pre-Lit Christmas Tree", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Seasonal"), image_path: "seasonal7.jpg")
Item.create(name: "Holiday Cheer Spreader", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Seasonal"), image_path: "seasonal8.jpg", active: false)

# -----------------------------Bath
puts "Creating Bath Items"
Item.create(name: "Polka Dot Shower Curtain", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Bath"), image_path: "bath1.jpg")
Item.create(name: "Toothbrush Assortment", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Bath"), image_path: "bath2.jpg", active: false)
Item.create(name: "Luxury Bath Mat", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Bath"), image_path: "bath3.jpg")
Item.create(name: "Shower Curtain with edge accents", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Bath"), image_path: "bath4.jpg")

# -----------------------------Mattresses
Item.create(name: "Sleep mat for large dog or small child", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Mattresses"), image_path: "Mattresses1.jpg")
Item.create(name: "This item speaks for itself", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Bath"), image_path: "Mattresses2.jpg")
Item.create(name: "Single Mattress with Deulxe Rorschach pattern", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Bath"), image_path: "Mattresses3.jpg")
Item.create(name: "Tetris Mattress", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Mattresses"), image_path: "Mattresses4.jpg", active: false)

# -----------------------------Users
15.times do |users|
  name = Faker::FamilyGuy.character
  username = "#{name.gsub(/\s+/, "").downcase}"
  password = name.split.first.downcase
  User.create(name: name, username: username, password: password, street: Faker::Address.street_address, city: Faker::Address.city, state: Faker::Address.state_abbr, country: Faker::Address.country, zip_code: Faker::Address.zip)
  puts "Created #{name}'s account'"
end

# -----------------------------Orders
def weighed_number(weights)
  raise 'Probabilities must sum up to 1' unless weights.values.inject(&:+) == 1.0

  u = 0.0
  ranges = Hash[weights.map{ |v, p| [u += p, v] }]

  u = rand
  ranges.find{ |p, _| p > u }.last
end

200.times do |order|
  t1 = Time.parse("2012-11-16 12:00:00")
  t2 = Time.parse("2018-09-15 12:00:00")
  created = Order.create(user_id: User.all.sample.id, status: weighed_number({0 => 0.2, 1 => 0.1, 2 => 0.1, 3 => 0.6 }), created_at: rand(t1..t2), updated_at: Time.now)
  random = weighed_number({1 => 0.2, 2 => 0.2, 3 => 0.2, 4 => 0.2, 5 => 0.2 })
  random.times do |add_item|
    created.items << Item.all.sample
  end
  puts "Created order #{created.id} for #{created.user.name}"
end

puts "Creating the admin"
# admin role still needs to be added
User.create(name: "admin", username: "admin", password: "admin", role: "admin")
