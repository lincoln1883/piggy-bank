class Transaction < ApplicationRecord
  validates_presence_of :name
  validates :amount, presence: true, numericality: { greater_than: 0 }

  belongs_to :category
  belongs_to :user
end
