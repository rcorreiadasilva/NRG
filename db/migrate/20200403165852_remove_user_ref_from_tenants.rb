class RemoveUserRefFromTenants < ActiveRecord::Migration[5.2]
  def change
    remove_column :tenants, :user_id
  end
end
