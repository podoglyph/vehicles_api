class AddCountryToMake < ActiveRecord::Migration[5.1]
  def change
    add_column :makes, :country, :string
  end
end
