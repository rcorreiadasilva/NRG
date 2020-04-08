class AddTenantToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :tenant, :boolean
  end
end
