require 'rails_helper'

RSpec.describe Api::V1::ExercisesController, :type => :controller, api: true do

	render_views

	describe '#index' do

		context 'when authenticated' do

			let(:user) {create(:user)}
			before { authenticate(user) }

			let!(:exercises) { create_list(:exercise, 10, user: user)}

			before do
				get :index, format: :json
			end

			it_behaves_like "a successful request"

			it "should assign correct exercises" do
				expect(assigns(:exercises)).to match_array(exercises)
			end

		end

		context 'when not authenticated' do

			before do
				get :index, format: :json
			end

			it_behaves_like "an unauthenticated request"
		end

	end
	

	describe '#show' do

		context 'when authenticated' do

			let(:user) {create(:user)}
			before { authenticate(user) }

			context 'when resource exists' do
				let(:exercise) { create(:exercise, user: user) }

				before do
					get :show, params: {id: exercise.id}, format: :json
				end

				it "should assigns correct value" do
					expect(assigns(:exercise)).to eq exercise
				end
			end

			context "when resource doesn't exist" do

				context 'when id is invalid' do

					before do
						get :show, params: {id: 0}, format: :json
					end

					it_behaves_like "a not found request"

				end

				context 'when the exercise belongs to another user' do

					let(:other) { create(:user) }
					let(:exercise) { create(:exercise, user: other) }

					before do
						get :show, params: {id: exercise.id}, format: :json
					end

					it_behaves_like "a not found request"
				end

			end


		end

		context 'when not authenticated' do

			let(:exercise) { create(:exercise) }

			before do
				get :show, params: {id: exercise.id}, format: :json
			end

			it_behaves_like "an unauthenticated request"

		end

	end


	describe '#create' do

		let(:name) { "Test Exercise Name" }
		let(:exercise_type) { create(:exercise_type) }

		context 'when authenticated' do

			let(:user) {create(:user)}
			before { authenticate(user) }

			context 'when valid parameters' do

				let(:new_exercise) { create(:exercise)}

				before do
					allow(ExerciseManager).to receive(:create_exercise).and_return(new_exercise)
					post :create, params: {exercise: {name: name, exercise_type_id: exercise_type.id} }, format: :json
				end

				it_behaves_like "a successful request"

				it "should assign exercise" do
					expect(assigns(:exercise)).to eq new_exercise
				end

				it "should set correct attributes" do
					expect(ExerciseManager).to have_received(:create_exercise).with(user, { "name" => name, "exercise_type_id" => exercise_type.id.to_s })
				end
			end

			context 'when invalid parameters' do
			end
		end

		context 'when not authenticated' do

			before do
				post :create, params: {exercise: {name: name, exercise_type_id: exercise_type.id} }, format: :json
			end

			it_behaves_like "an unauthenticated request"
		end

	end



	describe '#stop' do

		context 'when authenticated' do

			let(:user) {create(:user)}
			before { authenticate(user) }

			context 'when resource exists' do
				let(:exercise) { create(:exercise, user: user) }

				before do
					allow(ExerciseManager).to receive(:create_exercise_result)
					get :stop, params: {id: exercise.id}, format: :json
				end

				it "should assigns correct value" do
					expect(assigns(:exercise)).to eq exercise
				end

				it "should stop exercise" do
					exercise.reload
					expect(exercise.done).to be true
				end

				it "should create exercise result" do
					expect(ExerciseManager).to have_received(:create_exercise_result).with(exercise)
				end

			end

			context "when resource doesn't exist" do

				context 'when id is invalid' do

					before do
						get :stop, params: {id: 0}, format: :json
					end

					it_behaves_like "a not found request"

				end

				context 'when the exercise belongs to another user' do

					let(:other) { create(:user) }
					let(:exercise) { create(:exercise, user: other) }

					before do
						get :stop, params: {id: exercise.id}, format: :json
					end

					it_behaves_like "a not found request"
				end

			end


		end

		context 'when not authenticated' do

			let(:exercise) { create(:exercise) }

			before do
				get :stop, params: {id: exercise.id}, format: :json
			end

			it_behaves_like "an unauthenticated request"

		end
	end
end