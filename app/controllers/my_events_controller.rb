class MyEventsController < ApplicationController
  def show
  	if current_user.is_organization
  	else
  		redirect_to root_url, flash[:error] = "Access Denied. That page was for organizations only."
  	end
  end
end
