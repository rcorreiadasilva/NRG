class AddEndDateToConsumption < ActiveRecord::Migration[5.2]
  def change
    add_column :consumptions, :end, :string
  end
end
