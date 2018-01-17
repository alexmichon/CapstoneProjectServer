class Api::V1::ExercisesController < Api::V1::ApiController

	def index
		@exercises = Exercise.all
	end

	def show
		@exercise = Exercise.find(params[:id])
	end

	def create
		@exercise = ExerciseManager.new_exercise(current_user, exercise_params)
		@exercise.save!
		render :show
	end

	def stop
		@exercise = Exercise.find(params[:id])
		@exercise.done = true
		render :show
	end

	private

	def exercise_params
		params.require(:exercise).permit(:name, :exercise_type_id)
	end

end