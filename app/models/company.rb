class Company < ApplicationRecord
  validates :name, :vatcode, :address, :city, :postcode, presence: true

  has_many :users
end
