class Event < ActiveRecord::Base
	belongs_to :user
	has_and_belongs_to_many :users
  attr_accessible :address, :street, :city, :country, :description, :latitude, :longitude, :name, :user_id, :state
  geocoded_by :address
  after_validation :geocode
  
  def joined?(user)
  	users.exists? user
  end
  
  def organization
  	user = User.where(:id => self.user_id).first
  end

  def address
  	[street, city, state, country].compact.join(', ')
  end
end
