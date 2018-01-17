module Api
	module V1
		class ExerciseTypesController < ApiController
			before_action :authenticate_user!, only: :default_goal

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

			def default_goal
				@exercise_type = ExerciseType.find(params[:id])
				@exercise_goal = ExerciseManager.default_goal current_user, @exercise_type
			end

			private

			def exercise_type_params
				params.require(:exercise_type).permit(:name, :description)
			end

		end
	end
end