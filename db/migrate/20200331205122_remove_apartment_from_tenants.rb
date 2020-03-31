class RemoveApartmentFromTenants < ActiveRecord::Migration[5.2]
  def change
    :tenants, :apartment
  end
end
