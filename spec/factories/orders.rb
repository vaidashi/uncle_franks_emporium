FactoryGirl.define do
  factory :order do
    user
  end

  factory :order_with_items  do
    after(:create) do |order|
      create_list(:item, 3, :order => order)
    end
  end

end
