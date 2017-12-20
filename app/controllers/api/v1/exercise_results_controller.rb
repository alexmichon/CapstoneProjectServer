module Api
	module V1
		class ExerciseResultsController < ApiController

			before_action :find_exercise

			def show
				@exercise_result = @exercise.exercise_result
				render_error_msg "Exercise result not computed" unless @exercise_result
			end

			private

			def find_exercise
				@exercise = Exercise.find(params[:exercise_id])
			end

		end
	end
end