# spec/factories/transactions.rb

FactoryBot.define do
  factory :transaction do
    sequence(:name) { |n| "Transaction #{n}" }
    amount { Faker::Number.decimal(l_digits: 2) }
    category
    user
  end
end