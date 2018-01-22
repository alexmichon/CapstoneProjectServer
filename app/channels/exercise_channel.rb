class ExerciseChannel < ApplicationCable::Channel
	def subscribed
		begin
			@exercise = Exercise.find(params[:exercise_id])
		rescue
			reject
		end
		stream_from "exercise:#{params[:exercise_id]}"
	end

	def unsubscribed
		@exercise = nil
	end

	def save(data)
		@exercise.measurements.create!(data.slice("took_at", "value", "metric_id")) if @exercise
	end

end