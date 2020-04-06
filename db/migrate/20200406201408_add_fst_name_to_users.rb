class AddFstNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :fst_name, :string
  end
end
