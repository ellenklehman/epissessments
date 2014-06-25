FactoryGirl.define do
  sequence :email do |n|
    "user#{n}@example.com"
  end
  factory :user do
    name "Jane Doe"
    email
    password "password"
    password_confirmation "password"

    factory :user_with_subscription do
      subscription
    end

    factory :user_with_verified_subscription do
      association :subscription, factory: :subscription, verified: true
    end
  end
end
