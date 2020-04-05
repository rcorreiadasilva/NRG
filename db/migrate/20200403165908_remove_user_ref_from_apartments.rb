class RemoveUserRefFromApartments < ActiveRecord::Migration[5.2]
  def change
    remove_column :apartments, :user_id
  end
end
