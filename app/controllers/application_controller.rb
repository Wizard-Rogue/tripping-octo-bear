class ApplicationController < ActionController::Base
  protect_from_forgery
  rescue_from CanCan::AccessDenied do |exception|
  flash[:error] = "Access denied. Please sign in as an appropriate user."
  redirect_to root_url
	end

  def after_sign_in_path_for(resource)
  stored_location_for(resource) ||
    if @s
      session[:redirect] = true
    	new_organization_url
    else
      super
    end
  end
end
