require 'rails_helper'

RSpec.describe ExerciseManager, type: :model do

	describe ".create_exercise" do

		let(:user) { create(:user) }
		let(:exercise_type) { create(:exercise_type) }

		before do
			allow(ExerciseManager).to receive(:create_exercise_goal)
			@exercise = ExerciseManager.create_exercise(user, {exercise_type: exercise_type})
		end

		it { expect(@exercise.user).to be user }
		it { expect(@exercise.exercise_type).to be exercise_type }

		it { expect(ExerciseManager).to have_received(:create_exercise_goal) }

	end


	describe ".create_exercise_goal" do
		let(:user) { create(:user) }
		let(:exercise_type) { create(:exercise_type, :with_exercise_goal_default) }
		let(:exercise) { create(:exercise, user: user, exercise_type: exercise_type) }

		before do
			allow(MetricManager).to receive(:create_metric_goal)
			@exercise_goal = ExerciseManager.create_exercise_goal(user, exercise)
		end

		it { expect(@exercise_goal.exercise).to be(exercise) }

		it "should call MetricManager.create_metric_goal" do
			exercise_type.exercise_goal_default.metric_goal_defaults.each do |metric_goal_default|
				expect(MetricManager).to have_received(:create_metric_goal).with(user, @exercise_goal, metric_goal_default)
			end
		end

	end

	describe ".create_exercise_result" do
		let(:exercise_type) { create(:exercise_type, :with_exercise_goal_default) }
		let(:exercise) { create(:exercise, exercise_type: exercise_type) }

		context 'when exercise goal exists' do
			let!(:exercise_goal) { create(:exercise_goal, :with_metric_goals, exercise: exercise) }

			before do
				allow(MetricManager).to receive(:create_metric_result)
				@exercise_result = ExerciseManager.create_exercise_result(exercise)
			end

			it { expect(@exercise_result.exercise).to be(exercise) }
			it { expect(@exercise_result.exercise_goal).to be(exercise_goal) }

			it "should call MetricManager.create_metric_result" do
				exercise_goal.metric_goals.each do |metric_goal|
					expect(MetricManager).to have_received(:create_metric_result).with(exercise, @exercise_result, metric_goal)
				end
			end

		end
	end

end