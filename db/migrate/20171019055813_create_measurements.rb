class CreateMeasurements < ActiveRecord::Migration[5.1]
  def change
    create_table :measurements do |t|
    	t.float :value
    	t.timestamp :took_at
    	
      t.timestamps
    end
  end
end
