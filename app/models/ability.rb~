class Ability
  include CanCan::Ability
  
  def initialize(user)
  	user ||= User.new
  	
    if user.is_organization?
    	can :read, :all
    	can :join, :all
    	can :remove, :all
    	can :create, Event
    	can :update, Event do |event|
    		event.try(:user) == user
    	end
    	can :destroy, Event do |event|
    		event.try(:user) == user
    	end
    else
    	can :join, :all
    	can :read, :all
    	can :remove, :all
    end
  end
end
