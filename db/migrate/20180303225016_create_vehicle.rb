class CreateVehicle < ActiveRecord::Migration[5.1]
  def change
    create_table :vehicles do |t|
      t.references :make, foreign_key: true
      t.references :model, foreign_key: true
      t.references :option, foreign_key: true
      t.string :name
      t.timestamps
    end
  end
end
