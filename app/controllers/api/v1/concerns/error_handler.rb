module Api
	module V1
		module Concerns
			module ErrorHandler

				extend ActiveSupport::Concern

				def render_error(msg, status)
					status_code = Rack::Utils::SYMBOL_TO_STATUS_CODE[status]
					render json: {error: {status: status_code, message: msg}},
							status: status
				end

			end
		end
	end
end