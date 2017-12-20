class AddExerciseTypeToExercise < ActiveRecord::Migration[5.1]
  def change
  	add_reference :exercises, :exercise_type, :null => false
  end
end
