class CreateMeasurementSets < ActiveRecord::Migration[5.1]
  def change
    create_table :measurement_sets do |t|

      t.timestamps
    end
  end
end
