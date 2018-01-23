FactoryBot.define do
	factory :metric_goal do
		exercise_goal
		metric
		goal 100
		aggregator MeasurementAggregator::MEAN
		comparator MeasurementComparator::GTE
	end
end