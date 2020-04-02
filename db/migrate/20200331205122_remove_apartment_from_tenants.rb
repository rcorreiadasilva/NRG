class RemoveApartmentFromTenants < ActiveRecord::Migration[5.2]
  def change
   remove_column :tenants, :apartment
  end
end
