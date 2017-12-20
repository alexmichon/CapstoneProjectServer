module Api
	module V1
		class ExerciseTypesController < ApiController

			def index
				@exercise_types = ExerciseType.all
			end

			def show
				@exercise_type = ExerciseType.find(params[:id])
			end

			def create
				@exercise_type = ExerciseType.new(exercise_type_params)
				if @exercise_type.save
					render :show
				else
					render_error
				end
			end

			private

			def exercise_type_params
				params.require(:exercise_type).permit(:name, :description)
			end

		end
	end
end