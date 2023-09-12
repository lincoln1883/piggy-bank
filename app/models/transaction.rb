class Transaction < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :category
  validates_numericality_of :amount, numerical: { decimal: { greater_than: 0 } }

  has_and_belongs_to_many :category
  belongs_to :user
end
