class AddYearAndColorToModel < ActiveRecord::Migration[5.1]
  def change
    add_column :models, :year, :string
    add_column :models, :color, :string
  end
end
