class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # , :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  validates :name, presence: true, length: { minimum: 3 }
  has_many :categories
  has_many :transactions

  enum role: { admin: 'admin' }

  def admin?
    role == 'admin'
  end
end
