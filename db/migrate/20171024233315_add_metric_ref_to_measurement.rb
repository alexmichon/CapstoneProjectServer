class AddMetricRefToMeasurement < ActiveRecord::Migration[5.1]
  def change
  	add_reference :measurements, :metric, :null => false
  end
end
