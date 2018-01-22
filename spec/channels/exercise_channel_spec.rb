require 'rails_helper'

RSpec.describe ExerciseChannel, type: :channel do

	before do
		stub_connection exercise_id: exercise.id
	end

	let(:exercise) {create(:exercise)}
	let(:metric) {create(:metric)}

	let(:params) { double(exercise_id: exercise.id) }
	let(:data) do
		{
			"action" => "save",
			"took_at" => 1000,
			"value" => 213,
			"metric_id" => metric.id,
			"exercise_id" => exercise.id
		}
	end

	it "rejects subscription with unknown id" do
		subscribe(exercise_id: 99)
		expect(subscription).to be_rejected
	end

	it "subscribs when correct id" do
		subscribe(exercise_id: exercise.id)
		expect(subscription).to be_confirmed
	end

	context 'when subscribed' do

		before do
			subscribe(exercise_id: exercise.id)
		end

		it "creates measurement when receives data" do
			perform :save, data
			expect(exercise.measurements.count).to eq(1)
		end

	end


end