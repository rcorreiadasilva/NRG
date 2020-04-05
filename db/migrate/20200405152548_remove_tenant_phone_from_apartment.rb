class RemoveTenantPhoneFromApartment < ActiveRecord::Migration[5.2]
  def change
    remove_column :apartments, :tenant_phone
  end
end
