class CreateConsumptions < ActiveRecord::Migration[5.2]
  def change
    create_table :consumptions do |t|
      t.integer :inireading
      t.integer :lastreading
      t.boolean :paid
      t.references :apartment, foreign_key: true

      t.timestamps
    end
  end
end
