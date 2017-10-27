class Api::V1::MeasurementsController < Api::V1::ApiController
	before_action :find_measurement_set

	def index
		@measurements = @measurement_set.measurements.all
	end

	def show
		@measurement = @measurement_set.measurements.find(params[:id])
	end

	def create
		@measurement = @measurement_set.measurements.build measurement_params
		@measurement.save!
		render :show
	end

	private

	def measurement_params
		params.require(:measurement).permit(:took_at, :value)
	end

	def find_measurement_set
		@measurement_set = MeasurementSet.find(params[:measurement_set_id])
	end

end
