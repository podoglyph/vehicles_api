class CreateModels < ActiveRecord::Migration[5.1]
  def change
    create_table :models do |t|
      t.string :name
      t.timestamps
      t.references :make, foreign_key: true
    end
  end
end
