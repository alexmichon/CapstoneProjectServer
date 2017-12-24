class AddRangeToMetric < ActiveRecord::Migration[5.1]
  def change
  	add_column :metrics, :min, :float
  	add_column :metrics, :max, :float
  	add_column :metrics, :unit, :string
  end
end
