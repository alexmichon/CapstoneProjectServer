module Api
	module V1
		class ExerciseGoalsController < ApiController
			before_action :find_exercise

			def show
				@exercise_goal = @exercise.exercise_goal
				@exercise_goal = ExerciseManager.create_exercise_goal current_user, @exercise if @exercise_goal.nil?
				render_error_msg("No exercise goal defined", 404) unless @exercise_goal
			end

			def create
				@exercise_goal = @exercise.build_exercise_goal(exercise_goal_params)
			end

			private

			def exercise_goal_params
				params.require(:exercise_goal).permit(:metric_goals, :metric_goal_ids)
			end

			def find_exercise
				@exercise = Exercise.find(params[:exercise_id])
			end


		end
	end
end