class HomeController < ApplicationController
  def index
  	@events = Event.all
  	@event = Event.find(1)
  	@org = User.where(:is_organization => true).first
  end
end
