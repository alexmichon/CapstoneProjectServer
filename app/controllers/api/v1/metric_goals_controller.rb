module Api
	module V1
		class MetricGoalsController < ApiController

			before_action :find_exercise, :find_exercise_goal

			def index
				@metric_goals = @exercise_goal.metric_goals
			end

			def show
				@metric_goal = @exercise_goal.metric_goals.find(params[:id])
			end

			def create
				@metric_goal = @exercise_goal.metric_goals.build(metric_goal_params)
				if @metric_goal.save
					render :show
				else
					render_error
				end
			end

			private

			def metric_goal_params
				params.require(:metric_goal).permit(:metric_id, :goal)
			end

			def find_exercise
				@exercise = Exercise.find(params[:exercise_id])
			end

			def find_exercise_goal
				@exercise_goal = @exercise.exercise_goal
			end

		end
	end
end