class Transaction < ApplicationRecord
  validates_presence_of :name
  validates :amount, presence: true, numericality: { greater_than: 0 }

  has_and_belongs_to_many :category
  belongs_to :user
end
