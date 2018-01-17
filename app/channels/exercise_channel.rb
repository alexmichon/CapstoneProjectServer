class ExerciseChannel < ApplicationCable::Channel
	def subscribed
		@exercise = Exercise.find(params[:exercise_id])
		stream_from "exercise:#{params[:exercise_id]}"
	end

	def save(data)
		@exercise.measurements.create!(data.slice("took_at", "value", "metric_id"))
	end

end