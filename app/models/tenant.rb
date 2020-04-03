class Tenant < ApplicationRecord
  belongs_to :user, optional: true
  has_many :consumptions, through: :apartments
  belongs_to :apartment
end
