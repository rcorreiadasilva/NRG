class RemoveTenantFirstNameFromApartment < ActiveRecord::Migration[5.2]
  def change
    remove_column :apartments, :tenant_first_name
  end
end
