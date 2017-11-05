class AddSensorRefToMetrics < ActiveRecord::Migration[5.1]
  def change
  	add_reference :metrics, :sensor, :null => false
  end
end
