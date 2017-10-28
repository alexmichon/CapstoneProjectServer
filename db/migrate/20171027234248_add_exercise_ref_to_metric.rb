class AddExerciseRefToMetric < ActiveRecord::Migration[5.1]
  def change
  	add_reference :metrics, :exercise, :null => false
  end
end
