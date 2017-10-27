module Api
	module V1
		class ApiController < ApplicationController
			#include Concerns::Authenticator
			#include Concerns::ErrorHandler
			include DeviseTokenAuth::Concerns::SetUserByToken

			respond_to :json

			rescue_from ActiveRecord::RecordNotFound do |e|
				render_error e, :not_found
			end

			rescue_from ActiveRecord::RecordInvalid do |e|
				render_error_msg e.record.errors.details, 406
			end

			rescue_from ActiveRecord::RecordNotUnique do |e|
				render_error e, 422
			end

			rescue_from ActiveRecord::NotNullViolation do |e|
				render_error e, 422
			end

			def render_error(error, status)
				render_error_msg error.message, status
			end

			def render_error_msg(msg, status)
				render json: {error: msg}, status: status
			end

		end
	end
end 