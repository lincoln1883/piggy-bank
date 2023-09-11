class Category < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :icon

  belongs_to :user
  has_many :transactions
end
