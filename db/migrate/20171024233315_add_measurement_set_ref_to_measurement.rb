class AddMeasurementSetRefToMeasurement < ActiveRecord::Migration[5.1]
  def change
  	add_reference :measurements, :measurement_set, :null => false
  end
end
