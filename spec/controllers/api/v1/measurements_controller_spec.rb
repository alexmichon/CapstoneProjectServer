require 'rails_helper'

RSpec.describe Api::V1::MeasurementsController, :type => :controller, api: true do

	render_views

	let(:user) {create(:user)}
	let!(:exercise) {create(:exercise, user: user)}

	describe '#index' do

		context 'when authenticated' do

			before { authenticate(user) }

			context 'when exercise is valid' do

				let!(:measurements) { create_list(:measurement, 10, exercise: exercise)}

				before do
					get :index, params: {exercise_id: exercise.id}, format: :json
				end

				it_behaves_like "a successful request"

				it "should assign correct exercise" do
					expect(assigns(:exercise)).to eq exercise
				end

				it "should assign correct measurements" do
					expect(assigns(:measurements)).to match_array measurements
				end
			end

			context 'when exercise is not valid' do

				before do
					get :index, params: {exercise_id: 0}, format: :json
				end

				it_behaves_like "a not found request"

			end

		end

		context 'when not authenticated' do

			before do
				get :index, params: {exercise_id: exercise.id}, format: :json
			end

			it_behaves_like "an unauthenticated request"

		end
	end
	

	describe '#show' do

		context 'when authenticated' do

			let(:user) {create(:user)}
			before { authenticate(user) }

			context 'when exercise is valid' do
				context 'when measurement is valid' do
					let!(:measurement) { create(:measurement, exercise: exercise)}

					before do
						get :show, params: { exercise_id: exercise.id, id: measurement.id }, format: :json
					end

					it_behaves_like "a successful request"

					it "should assign correct measurement" do
						expect(assigns(:measurement)).to eq measurement
					end
				end

				context 'when measurement is invalid' do
					context 'when measurement id is invalid' do
						before do
							get :show, params: { exercise_id: exercise.id, id: 0 }, format: :json
						end

						it_behaves_like "a not found request"
					end

					context 'when measurement belongs to another exercise' do
						let(:other_exercise) { create(:exercise, user: user) }
						let(:measurement) { create(:measurement, exercise: other_exercise) }

						before do
							get :show, params: { exercise_id: exercise.id, id: measurement.id }, format: :json
						end

						it_behaves_like "a not found request"
					end
				end
			end

			context 'when exercise is invalid' do
				context 'when exercise id is invalid' do
					let!(:measurement) { create(:measurement, exercise: exercise)}

					before do
						get :show, params: { exercise_id: 0, id: measurement.id }, format: :json
					end

					it_behaves_like "a not found request"
				end

				context 'when exercise belongs to another user' do
					let(:other) { create(:user) }
					let(:other_exercise) { create(:exercise, user: other) }
					let(:other_measurement) { create(:measurement, exercise: other_exercise)}

					before do
						get :show, params: { exercise_id: other_exercise.id, id: other_measurement.id }, format: :json
					end

					it_behaves_like "a not found request"
				end
			end			

		end
	end
end