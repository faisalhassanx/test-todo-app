class User < ApplicationRecord
  validates :user, presence: true
  validates :email, presence: true
  
  has_many :todos
  
end