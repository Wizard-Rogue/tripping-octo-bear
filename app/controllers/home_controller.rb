class HomeController < ApplicationController
  def index
  	@apology = false
  	@nouser = false
  	if Event.first.nil?
  		@apology = true;
  	else
	  	@events = Event.all
	  	@event = Event.find(1)
	end
	if User.first.nil? || User.where(:is_organization => true).first.nil?
		@nouser = true;
	else
		@org = User.where(:is_organization => true).first
	end
  end
end