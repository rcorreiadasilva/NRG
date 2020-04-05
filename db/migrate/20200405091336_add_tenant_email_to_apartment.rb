class AddTenantEmailToApartment < ActiveRecord::Migration[5.2]
  def change
    add_column :apartments, :tenant_email, :text
  end
end
