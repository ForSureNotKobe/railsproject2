class Lesson < ApplicationRecord
  validates :name, :time, :price, presence: true

  belongs_to :company, optional: true
end
