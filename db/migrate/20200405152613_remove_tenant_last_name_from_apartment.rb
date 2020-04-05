class RemoveTenantLastNameFromApartment < ActiveRecord::Migration[5.2]
  def change
    remove_column :apartments, :tenant_last_name
  end
end
