module Api
	module V1
		class ApiController < ApplicationController
			#include Concerns::Authenticator
			#include Concerns::ErrorHandler
			include DeviseTokenAuth::Concerns::SetUserByToken

			respond_to :json
		end
	end
end 