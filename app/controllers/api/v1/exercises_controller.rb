class Api::V1::ExercisesController < Api::V1::ApiController

	def index
		@exercises = Exercise.all
	end

	def show
		@exercise = Exercise.find(params[:id])
	end

	def create
		@exercise = Exercise.new exercise_params
		@exercise.save!
		render :show
	end

	private

	def exercise_params
		params.require(:exercise).permit(:name)
	end

end