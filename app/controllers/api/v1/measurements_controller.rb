class Api::V1::MeasurementsController < Api::V1::ApiController


	def index
		@measurements = Measurement.all
	end

	def show
		@measurement = Measurement.find(params[:id])
	end

	def create
	end

end
