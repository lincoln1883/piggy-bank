class Category < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3 }
  validates :icon, presence: true

  has_many :transactions, dependent: :destroy
  belongs_to :user

  def total_amount
    transactions.sum(:amount)
  end
end
