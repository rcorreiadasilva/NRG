class Tenant < ApplicationRecord

  #has_many :consumptions, through: :apartments
  # Creates the tenant.apartment method
  belongs_to :apartment #, optional: true
end
