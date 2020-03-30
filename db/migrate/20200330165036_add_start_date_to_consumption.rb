class AddStartDateToConsumption < ActiveRecord::Migration[5.2]
  def change
    add_column :consumptions, :start, :string
  end
end
