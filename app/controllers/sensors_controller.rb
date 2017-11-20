class SensorsController < ApplicationController

	before_action :find_exercise

	def index
		@sensors = @exercise.metrics.select(:sensor).distinct
	end

	def show
		@sensor = @exercise.metrics.select(:sensor).distinct.find(params[:id])
	end

	private

	def find_exercise
		@exercise = Exercise.find(params[:exercise_id])
	end

end