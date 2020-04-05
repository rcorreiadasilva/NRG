class AddTenantLastNameToApartment < ActiveRecord::Migration[5.2]
  def change
    add_column :apartments, :tenant_last_name, :text
  end
end
