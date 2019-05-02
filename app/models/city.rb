class City < ApplicationRecord
  has_many :users
  has_many :gossips, through: :users 
  validates :name, length: { in: 2..200 }, presence: true
  validates :zip_code, length: { in: 2..50 }, presence: true
end
