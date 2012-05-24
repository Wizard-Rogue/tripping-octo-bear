class HomeController < ApplicationController
  def index
  	@events = Event.find([2,3])
  	@event = Event.find(1)
  	@org = User.where(:is_organization => true).first
  end
end
