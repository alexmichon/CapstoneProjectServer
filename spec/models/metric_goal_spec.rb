# == Schema Information
#
# Table name: metric_goals
#
#  id               :integer          not null, primary key
#  exercise_goal_id :integer
#  metric_id        :integer
#  goal             :float(24)
#  aggregator       :string(255)
#  comparator       :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_metric_goals_on_exercise_goal_id  (exercise_goal_id)
#  index_metric_goals_on_metric_id         (metric_id)
#

require 'rails_helper'

RSpec.describe MetricGoal, type: :model do
  
	it { should validate_presence_of(:exercise_goal) }
	it { should validate_presence_of(:metric) }
	it { should validate_presence_of(:goal) }
	it { should validate_presence_of(:aggregator) }
	it { should validate_presence_of(:comparator) }

end
