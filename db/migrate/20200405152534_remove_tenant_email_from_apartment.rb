class RemoveTenantEmailFromApartment < ActiveRecord::Migration[5.2]
  def change
    remove_column :apartments, :tenant_email
  end
end
