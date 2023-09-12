class Category < ApplicationRecord
  validates :name, presence: true
  validates :icon, presence: true

  has_many :transactions
  belongs_to :user

  def total_amount
    transactions.sum(:amount)
  end
end
