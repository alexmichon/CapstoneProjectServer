class AddDurationToExercise < ActiveRecord::Migration[5.1]
  def change
  	add_column :exercises, :duration, :integer, :null => false
  end
end
