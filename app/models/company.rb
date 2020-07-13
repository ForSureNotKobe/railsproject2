class Company < ApplicationRecord
  validates :name, :vatcode, :address, :city, :postcode, presence: true

  has_many :users
  has_many :clients
  has_many :lessons
end
