module ControllerSpecHelpers
	
	def authorize
		controller.stub(:authenticate_user! => true)
	end

	def authenticate(user)
		authorize
		controller.stub(:current_user => user)
	end

end