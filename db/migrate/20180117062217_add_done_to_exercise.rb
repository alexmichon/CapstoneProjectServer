class AddDoneToExercise < ActiveRecord::Migration[5.1]
  def change
  	add_column :exercises, :done, :boolean, :default => false
  end
end
