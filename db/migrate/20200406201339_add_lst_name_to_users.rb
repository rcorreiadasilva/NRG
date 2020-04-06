class AddLstNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :lst_name, :string
  end
end
