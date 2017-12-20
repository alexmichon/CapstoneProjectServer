class CreateMetricResults < ActiveRecord::Migration[5.1]
  def change
    create_table :metric_results do |t|
      t.belongs_to :exercise_result
      t.belongs_to :metric_goal
      t.float :actual
      t.boolean :result

      t.timestamps
    end
  end
end
