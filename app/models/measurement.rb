# == Schema Information
#
# Table name: measurements
#
#  id          :integer          not null, primary key
#  value       :float(24)        not null
#  took_at     :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  metric_id   :integer          not null
#  exercise_id :integer          not null
#
# Indexes
#
#  index_measurements_on_exercise_id  (exercise_id)
#  index_measurements_on_metric_id    (metric_id)
#

class Measurement < ApplicationRecord
	belongs_to :metric
	belongs_to :exercise

	default_scope { order(took_at: :asc) }
end
