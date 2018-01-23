module ControllerSpecHelpers
	
	def authorize
		allow(controller).to receive(:authenticate_user!).and_return(true)
	end

	def authenticate(user)
		authorize
		allow(controller).to receive(:current_user).and_return(user)
	end

end