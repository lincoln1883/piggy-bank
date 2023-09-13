class Transaction < ApplicationRecord
  validates_presence_of :name
  validates :category_id, presence: true
  validates_numericality_of :amount, numerical: { decimal: { greater_than: 0 } }

  has_and_belongs_to_many :category
  belongs_to :user
end
