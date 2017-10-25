module Api
	module V1
		class ApiController < ApplicationController
			#include Concerns::Authenticator
			#include Concerns::ErrorHandler
			include DeviseTokenAuth::Concerns::SetUserByToken

			respond_to :json

			rescue_from ActiveRecord::RecordNotFound do |e|
				render json: {error: e.message}, status: :not_found
			end 
		end
	end
end 