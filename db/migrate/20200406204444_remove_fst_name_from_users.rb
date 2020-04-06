class RemoveFstNameFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :fst_name
  end
end
