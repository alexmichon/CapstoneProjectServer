class AddDoctorRefToUsers < ActiveRecord::Migration[5.1]
  def change
  	add_reference :users, :doctor, index: true, null: true
  end
end
