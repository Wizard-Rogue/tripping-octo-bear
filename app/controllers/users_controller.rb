class UsersController < ApplicationController
	def profile
		if current_user.is_organization
	      render 'organization_profile'
	    else
	      render 'volunteer_profile'
    	end
	end
end
