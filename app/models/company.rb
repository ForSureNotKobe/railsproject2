class Company < ApplicationRecord
  validates :name, :vatcode, :adress, :city, :postcode, presence: true

  has_many :users
end
