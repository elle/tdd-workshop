FactoryBot.define do
  factory :comment do
    post
    user
    body { "My comment" }
  end

  factory :person, aliases: [:user] do
    first_name { "John" }
    sequence(:email) { |n| "user_#{n}@example.com" }
  end

  factory :post do
    title { "Post title" }
    person
  end
end
