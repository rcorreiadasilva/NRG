class CreateApartments < ActiveRecord::Migration[5.2]
  def change
    create_table :apartments do |t|
      t.string :building
      t.integer :floor
      t.string :door
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
