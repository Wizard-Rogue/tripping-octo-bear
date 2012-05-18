class Event < ActiveRecord::Base
	belongs_to :user
	has_and_belongs_to_many :users
  attr_accessible :address, :city, :country, :description, :latitude, :longitude, :name, :user_id, :state
#  geocoded_by :address
#  reverse_geocoded_by :latitude, :longitude
#  after_validation :geocode, :reverse_geocode
  
  def joined?(user)
  	users.exists? user
  end
  
  def organization
  	user = User.where(:id => self.user_id).first
  end
end
