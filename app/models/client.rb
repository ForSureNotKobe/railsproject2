class Client < ApplicationRecord
  belongs_to :company, optional: true
end
