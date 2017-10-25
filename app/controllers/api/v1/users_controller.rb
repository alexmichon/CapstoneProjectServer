module Api
	module V1
		class UsersController < ApiController
			#skip_before_action :auth_with_token!, only: [:create, :reset_password]
			#before_action :authenticate_user!

			def index
				@users = User.all
			end

			def show
				@user = User.find(params[:id])
			end

			def create
			end

		end
	end
end
