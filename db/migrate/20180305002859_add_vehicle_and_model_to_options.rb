class AddVehicleAndModelToOptions < ActiveRecord::Migration[5.1]
  def change
    add_reference :options, :vehicle, foreign_key: true
    add_reference :options, :model, foreign_key: true
  end
end
