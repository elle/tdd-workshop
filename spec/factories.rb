FactoryBot.define do
  factory :person do
    first_name { "John" }
    sequence(:email) { |n| "user_#{n}@example.com" }
  end

  factory :post do
    title { "Post title" }
    person
  end
end
