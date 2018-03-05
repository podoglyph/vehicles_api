class CreateVehicle < ActiveRecord::Migration[5.1]
  def change
    create_table :vehicles do |t|
      t.string :nickname
      t.string :mileage
      t.column :condition, :integer, default: 0
      t.boolean :pre_owned, default: false
      t.bigint :price
      t.references :model, foreign_key: true
      t.timestamps
    end
  end
end
