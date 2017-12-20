class CreateJoinTableExerciseTypeMetric < ActiveRecord::Migration[5.1]
  def change
    create_join_table :exercise_types, :metrics do |t|
      t.index [:exercise_type_id, :metric_id]
    end
  end
end
