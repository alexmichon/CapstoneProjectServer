# == Schema Information
#
# Table name: metric_results
#
#  id                 :integer          not null, primary key
#  exercise_result_id :integer
#  metric_goal_id     :integer
#  actual             :float(24)
#  result             :boolean
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_metric_results_on_exercise_result_id  (exercise_result_id)
#  index_metric_results_on_metric_goal_id      (metric_goal_id)
#

require 'rails_helper'

RSpec.describe MetricResult, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
