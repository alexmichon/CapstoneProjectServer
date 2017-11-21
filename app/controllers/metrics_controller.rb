class MetricsController < ApplicationController

	before_action :find_exercise

	def index
		@metrics = @exercise.metrics.all
	end

	def show
		@metric = @exercise.metrics.find(params[:id]).decorate
	end

	private

	def find_exercise
		@exercise = Exercise.find(params[:exercise_id])
	end

end
