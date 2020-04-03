class AddUserRefToTenants < ActiveRecord::Migration[5.2]
  def change
    add_reference :tenants, :user, foreign_key: true
  end
end
