class User < ApplicationRecord
  validates_presence_of :name
  has_many :categories
  has_many :transactions
end
