class AddTenantFirstNameToApartment < ActiveRecord::Migration[5.2]
  def change
    add_column :apartments, :tenant_first_name, :text
  end
end
