class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :furima
  has_one :shipping
end
