class RemoveLstNameFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :lst_name
  end
end
