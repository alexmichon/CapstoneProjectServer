class AddUserRefToExercise < ActiveRecord::Migration[5.1]
  def change
  	add_reference :exercises, :user, :null => false
  end
end
