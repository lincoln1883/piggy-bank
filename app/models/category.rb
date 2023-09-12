class Category < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :icon

  has_many :transactions
  belongs_to :user

  def total_amount
    transactions.sum(:amount)
  end
end
