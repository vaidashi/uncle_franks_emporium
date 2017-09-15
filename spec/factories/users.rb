FactoryGirl.define do
  factory :user do
    sequence(:username) do |i|
      "D#{i}"
    end
    name "Dennis"
    password "MyPassword"

    factory :user_with_orders do
      after(:create) do |user|
        create_list(:order, 3, :user => user)
      end
    end
  end
end
