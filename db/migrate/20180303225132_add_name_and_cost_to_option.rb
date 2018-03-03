class AddNameAndCostToOption < ActiveRecord::Migration[5.1]
  def change
    add_column :options, :cost, :integer
  end
end
