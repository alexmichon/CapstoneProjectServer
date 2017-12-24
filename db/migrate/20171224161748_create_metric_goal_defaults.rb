class CreateMetricGoalDefaults < ActiveRecord::Migration[5.1]
  def change
    create_table :metric_goal_defaults do |t|
      t.belongs_to :exercise_goal_default
      t.belongs_to :metric
      t.float :goal

      t.string :aggregator
      t.string :comparator
    end
  end
end
