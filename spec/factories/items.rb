FactoryGirl.define do
  factory :item do
    sequence(:name) do |i|
      "Couch#{i}"
    end
    description "Really Dirty"
    price 50.0
    image_path "grosscouch.jpg"
    active true
    category 
  end
end
