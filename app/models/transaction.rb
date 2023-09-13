class Transaction < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3 }
  validates :category_id, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates_associated :category

  belongs_to :category
  belongs_to :user
end
