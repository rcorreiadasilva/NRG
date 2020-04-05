class Apartment < ApplicationRecord
  # Creates the apartmnent.consumptions method
  has_many :consumptions, dependent: :destroy
   # Creates the apartmnent.tenants method
  has_many :tenants, dependent: :destroy
end
