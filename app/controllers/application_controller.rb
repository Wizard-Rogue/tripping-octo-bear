class ApplicationController < ActionController::Base
  protect_from_forgery
  rescue_from CanCan::AccessDenied do |exception|
  flash[:error] = "Access denied. Please sign in as an appropriate user."
  redirect_to root_url
	end
end
