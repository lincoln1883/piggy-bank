# spec/factories/categories.rb

FactoryBot.define do
  factory :category do
    sequence(:name) { |n| "Category #{n}" }
    icon { 'https://picsum.photos/200' }
    user

    factory :category_with_transactions do
      transient do
        transactions_count { 3 }
      end

      after(:create) do |category, evaluator|
        transactions = create_list(:transaction, evaluator.transactions_count, category:, user: category.user)
        category.update(total_amount: transactions.sum(&:amount))
      end
    end
  end
end
