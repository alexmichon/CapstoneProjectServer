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

class Metric < ApplicationRecord
	has_many :measurements, dependent: :destroy
	belongs_to :sensor

	has_and_belongs_to_many :exercise_types

	has_many :metric_goal_defaults

	default_scope { order(name: :asc) }

	validates :name, :sensor, presence: true
	validates :name, uniqueness: true

	def default_goal
		return self.min
	end
end
