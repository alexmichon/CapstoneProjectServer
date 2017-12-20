class CreateExerciseResults < ActiveRecord::Migration[5.1]
  def change
    create_table :exercise_results do |t|
      t.belongs_to :exercise_goal
      t.belongs_to :exercise

      t.timestamps
    end
  end
end
