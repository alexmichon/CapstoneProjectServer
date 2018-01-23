FactoryBot.define do
	factory :metric_goal_default do
		exercise_goal_default
		metric
		goal 100
		aggregator MeasurementAggregator::MEAN
		comparator MeasurementComparator::GTE
	end
end