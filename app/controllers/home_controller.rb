class HomeController < ApplicationController
  def index
  	unless Event.first.nil?
  		@events = Event.find([2,3])
  		@event = Event.find(1)
  	else
  		@events = Event.new
  		@events = Event.new
  	end
  	unless User.first.nil?
  		@org = User.where(:is_organization => true).first
  	else
  		@org = User.new
  	end
  end
end