class Consumption < ApplicationRecord
  belongs_to :apartment
  # validates :paid, inclusion: { in: 'paid','unpaid' }
  #belongs_to :tenant
end
