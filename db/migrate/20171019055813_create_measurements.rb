class CreateMeasurements < ActiveRecord::Migration[5.1]
  def change
    create_table :measurements do |t|
    	t.float :value, null: false
    	t.bigint :took_at, null: false
    	
      t.timestamps
    end
  end
end
