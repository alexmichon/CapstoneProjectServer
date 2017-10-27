class AddNameToMeasurementSets < ActiveRecord::Migration[5.1]
  def change
  	add_column :measurement_sets, :name, :string, null: false
  	add_index :measurement_sets, :name, unique: true
  end
end
