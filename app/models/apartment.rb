class Apartment < ApplicationRecord
  belongs_to :user
  has_many :consumptions, dependent: :destroy
  has_many :tenants
end
