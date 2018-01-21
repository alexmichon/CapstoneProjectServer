class AddDurationToExerciseType < ActiveRecord::Migration[5.1]
  def change
  	add_column :exercise_types, :duration, :integer, :null => false
  end
end
