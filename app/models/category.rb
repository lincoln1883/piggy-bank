class Category < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :icon

  has_many :transactions
end
