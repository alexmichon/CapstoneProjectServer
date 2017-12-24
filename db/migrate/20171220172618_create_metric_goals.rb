class CreateMetricGoals < ActiveRecord::Migration[5.1]
  def change
    create_table :metric_goals do |t|
      t.belongs_to :exercise_goal
      t.belongs_to :metric
      t.float :goal

      t.string :aggregator
      t.string :comparator

      t.timestamps
    end
  end
end
