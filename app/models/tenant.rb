class Tenant < ApplicationRecord
  belongs_to :user
  has_many :consumptions, dependent: :destroy
end
