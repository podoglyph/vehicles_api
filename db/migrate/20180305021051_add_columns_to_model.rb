class AddColumnsToModel < ActiveRecord::Migration[5.1]
  def change
    add_column :models, :base_price, :bigint
    add_column :models, :style, :string
  end
end
