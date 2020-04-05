class AddTenantPhoneToApartment < ActiveRecord::Migration[5.2]
  def change
    add_column :apartments, :tenant_phone, :integer
  end
end
