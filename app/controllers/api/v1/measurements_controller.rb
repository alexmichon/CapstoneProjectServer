class Api::V1::MeasurementsController < Api::V1::ApiController
	before_action :find_exercise

	def index
		@measurements = @exercise.measurements.all
	end

	def show
		@measurement = @exercise.measurements.find(params[:id])
	end

	def create
		@measurement = @exercise.measurements.build measurement_params
		@measurement.save!
		render :show
	end

	def save
		puts @exercise.id
		params[:measurements].each do |meas|
			puts meas
			begin
				@exercise.measurements.create!(meas)
			rescue ActiveModel::ForbiddenAttributesError
			end
		end
		render :index
	end

	private

	def measurement_params
		params.require(:measurement).permit(:took_at, :value, :metric_id)
	end

	def measurements_params
		params.require(:measurements)
	end

	def find_exercise
		@exercise = Exercise.find(params[:exercise_id])
	end

end
