class Ability
  include CanCan::Ability
  
  def initialize(user)
  	user ||= User.new
  	
    if user.is_organization?
    	can :read, :all
    	can :create, Event
    	can :update, Event do |event|
    		event.try(:user) == user
    	end
    	can :destroy, Event do |event|
    		event.try(:user) == user
    	end
    else
    	can :read, :all
    end
  end
end
