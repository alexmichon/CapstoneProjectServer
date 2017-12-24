class CreateExerciseGoalDefaults < ActiveRecord::Migration[5.1]
  def change
    create_table :exercise_goal_defaults do |t|
    	t.belongs_to :exercise_type, null: false
    end
  end
end
