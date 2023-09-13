# spec/factories/users.rb

FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "User #{n}" }
    email { Faker::Internet.unique.email }
    password { 'password123' }
    confirmed_at { Time.now }

    trait :admin do
      role { 'admin' }
    end
  end
end
