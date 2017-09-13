# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Item.destroy_all
Category.destroy_all


CATEGORIES = ["Furniture", "Bath", "Kitchen", "Matresses", "Seasonal"]

CATEGORIES.each do |category|
  created = Category.create(name: category)
  puts "Created #{created.name} category."
end

# Furniture
puts "Creating Furniture Items"
Item.create(name: "Reduced Height Couch", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Furniture"), image_path: "furniture1.png")
Item.create(name: "Pallet Chic Backyard Set", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Furniture"), image_path: "furniture2.png")
Item.create(name: "Distressed Beach Couch", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Furniture"), image_path: "furniture3.png")
Item.create(name: "Antique Entertainment Center", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Furniture"), image_path: "furniture4.png")
Item.create(name: "Shabby Chic Retro Sofa", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Furniture"), image_path: "furniture5.png")
Item.create(name: "Extended Storage Sofa", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Furniture"), image_path: "furniture6.png")
Item.create(name: "Dual Tone Distressed Deconstructed Couch", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Furniture"), image_path: "furniture7.png")
Item.create(name: "Overstuffed Deconstruced Couch", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Furniture"), image_path: "furniture8.png")
Item.create(name: "Floral Pattern Yard Sofa", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Furniture"), image_path: "furniture9.png")
Item.create(name: "Wasteland Chic Chaise", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Furniture"), image_path: "furniture10.png")
Item.create(name: "Shabby Chic Deconstructed Couch", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Furniture"), image_path: "furniture11.png")
Item.create(name: "Distressed Dual Tone Leather Sofa", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Furniture"), image_path: "furniture12.png")

# # Kitchen
# puts "Creating Kitchen Items"
# Item.create(name: "Wasteland Chic Fridge", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Kitchen"), image_path: "kitchen1.jpg")
# Item.create(name: "Pre-weathered Deluxe Microwave", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Kitchen"), image_path: "kitchen2.jpg")
# Item.create(name: "Yard Microwave", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Kitchen"), image_path: "kitchen3.jpg")
# Item.create(name: "Deluxe Toaster with Toast Extraction Tool", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Furniture"), image_path: "kitchen4.jpg")
# Item.create(name: "Shabby Chic Microwave", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Kitchen"), image_path: "kitchen5.jpg")
# Item.create(name: "Deluxe 'Probably an Oven'", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Kitchen"), image_path: "kitchen6.jpg")
# Item.create(name: "Rust Based Pan", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Kitchen"), image_path: "kitchen7.jpg")
#
# # Seasonal
# puts "Creating Seasonal Items"
# Item.create(name: "Artesinal Jack 'O Lantern", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Seasonal"), image_path: "seasonal1.jpg")
# Item.create(name: "Portable Christmas Tree", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Seasonal"), image_path: "seasonal2.jpg")
# Item.create(name: "Organic Handcrafted Carved Pumpkin", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Seasonal"), image_path: "seasonal3.jpg")
# Item.create(name: "Ornaments Assortment", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Seasonal"), image_path: "seasonal4.jpg")
# Item.create(name: "Pre-Verified Fireworks", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Seasonal"), image_path: "seasonal5.jpg")
# Item.create(name: "Pre-Lit Christmas Tree", description: Faker::Hipster.paragraph, price: rand(100..1000), category: Category.find_by(name: "Seasonal"), image_path: "seasonal6.jpg")

# # Bath
# puts "Creating Bath Items"
# Item.create(name: "xxxxx", description: Faker::Hipster.paragraph, price: rand(100..1000), category: "Bath", image_path: "bath1.jpg")
# Item.create(name: "xxxxx", description: Faker::Hipster.paragraph, price: rand(100..1000), category: "Bath", image_path: "bath2.jpg")
# Item.create(name: "xxxxx", description: Faker::Hipster.paragraph, price: rand(100..1000), category: "Bath", image_path: "bath3.jpg")
# Item.create(name: "xxxxx", description: Faker::Hipster.paragraph, price: rand(100..1000), category: "Bath", image_path: "bath4.jpg")
# Item.create(name: "xxxxx", description: Faker::Hipster.paragraph, price: rand(100..1000), category: "Bath", image_path: "bath5.jpg")


# 10.times do |users|
#   name = Faker::FamilyGuy.character
#   email = "#{name.gsub(/\s+/, "")}@fox.com"
#   password = name.split.first.downcase
#   User.create(name: name, email: email, password: password)
#   puts "Created #{name}'s account'"
# end
