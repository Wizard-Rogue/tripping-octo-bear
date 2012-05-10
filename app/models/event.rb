class Event < ActiveRecord::Base
	belongs_to :organization
	has_many :participants
	has_many :users, :through => :participants
  attr_accessible :address, :city, :country, :description, :latitude, :longitude, :name, :organization_id, :state
end
