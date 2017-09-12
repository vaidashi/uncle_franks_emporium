FactoryGirl.define do
  factory :category do
    sequence(:name) do |i|
      "Category#{i}"
    end

    factory :category_with_items do
      after(:create) do |category|
        create_list(:item, 2 ,:category => category)
      end
    end
  end
end
