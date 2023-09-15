# spec/factories/users.rb

FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "User #{n}" }
    email { Faker::Internet.unique.email }
    password { 'password123' }

    trait :admin do
      role { 'admin' }
    end
  end
end
