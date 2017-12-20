class CreateExerciseGoals < ActiveRecord::Migration[5.1]
  def change
    create_table :exercise_goals do |t|
      t.belongs_to :exercise

      t.timestamps
    end
  end
end
