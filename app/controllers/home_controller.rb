class HomeController < ApplicationController
  def index
  	@events = Event.all
  	@org = User.where(:is_organization => true).first
  end
end
