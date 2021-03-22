class Category < ApplicationRecord
  validates :name, uniqueness: true
  # has_many :users
  has_many :doctors
end
