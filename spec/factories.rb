FactoryBot.define do
  factory :person do
    first_name { "John" }
    sequence(:email) { |n| "user_#{n}@example.com" }
  end
end
