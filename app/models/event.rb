class Event < ActiveRecord::Base
	belongs_to :user
	has_many :participants
	has_many :users, :through => :participants
  attr_accessible :address, :city, :country, :description, :latitude, :longitude, :name, :user_id, :state
end
