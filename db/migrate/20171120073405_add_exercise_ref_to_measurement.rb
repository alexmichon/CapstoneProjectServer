class AddExerciseRefToMeasurement < ActiveRecord::Migration[5.1]
  def change
  	add_reference :measurements, :exercise, :null => false
  end
end