# == Schema Information
#
# Table name: metrics
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string(255)      not null
#  sensor_id  :integer          not null
#  min        :float(24)
#  max        :float(24)
#  unit       :string(255)
#
# Indexes
#
#  index_metrics_on_sensor_id  (sensor_id)
#

FactoryBot.define do
	factory :metric do
		sensor
		sequence(:name) {|n| "metric#{n}"}
	end
end
