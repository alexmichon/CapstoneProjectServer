module Api
	module V1
		class UsersController < ApiController
			#skip_before_action :auth_with_token!, only: [:create, :reset_password]
			before_action :authenticate_user!

			def index
				@users = User.all
				render json: {user: User.first.email}
			end

			def create
			end

		end
	end
end
