require 'rails_helper'

RSpec.describe MetricManager, type: :model do

	describe '.create_metric_goal' do
		let(:user) { create(:user) }
		let(:exercise) { create(:exercise, user: user) }
		let(:exercise_goal) { create(:exercise_goal, exercise: exercise) }
		let(:metric_goal_default) { create(:metric_goal_default) }

		shared_context "create correct metric goal" do
			it "should call last_value" do
				expect(MetricManager).to have_received(:last_value).with(user, metric_goal_default.metric, metric_goal_default.aggregator)
			end

			it "should save metric_goal" do
				expect(@metric_goal).to be_persisted
			end

			it "should make metric goal belong to correct exercise goal" do
				expect(@metric_goal.exercise_goal_id).to eq exercise_goal.id
			end

			it "should set correct attributes to metric goal" do
				expect(@metric_goal.aggregator).to eq metric_goal_default.aggregator
				expect(@metric_goal.comparator).to eq metric_goal_default.comparator
				expect(@metric_goal.metric_id).to eq metric_goal_default.metric_id
			end
		end

		context 'when last value is not nil' do
			let(:last_value) { 9999 }

			before do
				allow(MetricManager).to receive(:last_value).and_return(last_value)
				@metric_goal = MetricManager.create_metric_goal(user, exercise_goal, metric_goal_default)
			end

			it_behaves_like "create correct metric goal"

			it "should set correct goal" do
				expect(@metric_goal.goal).to eq last_value
			end
		end

		context 'when last value is nil' do
			let(:last_value) { nil }

			before do
				allow(MetricManager).to receive(:last_value).and_return(last_value)
				@metric_goal = MetricManager.create_metric_goal(user, exercise_goal, metric_goal_default)
			end

			it_behaves_like "create correct metric goal"

			it "should set default goal" do
				expect(@metric_goal.goal).to eq metric_goal_default.goal
			end
		end

	end

	describe '.create_metric_result' do
		let(:exercise) { create(:exercise) }

		let(:exercise_goal) { create(:exercise_goal, exercise: exercise) }
		let(:exercise_result) { create(:exercise_result, exercise: exercise, exercise_goal: exercise_goal) }

		let(:metric) { create(:metric) }
		let(:metric_goal) { create(:metric_goal, exercise_goal: exercise_goal, metric: metric) }

		let!(:measurements) { create_list(:measurement, 10, exercise: exercise, metric: metric)}
		let!(:other_measurements) { create_list(:measurement, 10, exercise: exercise)}

		let(:actual) { 1234 }
		let(:result) { true }

		before do
			allow(MeasurementAggregator).to receive(:aggregate).and_return(actual)
			allow(MeasurementComparator).to receive(:compare).and_return(result)

			@metric_result = MetricManager.create_metric_result(exercise, exercise_result, metric_goal)
		end

		it "should call MeasurementAggregator" do
			expect(MeasurementAggregator).to have_received(:aggregate).with(match_array(measurements), metric_goal.aggregator)
		end

		it "should call MeasurementComparator" do
			expect(MeasurementComparator).to have_received(:compare).with(metric_goal.goal, actual, metric_goal.comparator)
		end

		it "should save metric result" do
			expect(@metric_result).to be_persisted
		end

		it "should make metric result belong to correct exercise result" do
			expect(@metric_result.exercise_result_id).to eq exercise_result.id
		end

		it "should set correct attributes to exercise result" do
			expect(@metric_result.actual).to eq actual
			expect(@metric_result.result).to eq result
			expect(@metric_result.metric_goal_id).to eq metric_goal.id
		end

	end

	describe '.last_value' do
		let(:user) { create(:user) }
		let!(:exercise) { create(:exercise, user: user, done: true) }

		let(:metric) { create(:metric) }

		let!(:measurements) { create_list(:measurement, 10, exercise: exercise, metric: metric) }
		let!(:other_measurements) { create_list(:measurement, 10, exercise: exercise) }

		let(:aggregator) { MeasurementAggregator::MEAN }
		let(:value) { 1234 }

		before do
			allow(MeasurementAggregator).to receive(:aggregate).and_return(value)
			@value = MetricManager.last_value(user, metric, aggregator)
		end

		it "should call MeasurementAggregator" do
			expect(MeasurementAggregator).to have_received(:aggregate).with(match_array(measurements), aggregator)
		end

		it "should return correct value" do
			expect(@value).to eq value
		end
	end

end