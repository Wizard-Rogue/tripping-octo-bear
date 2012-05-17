class Event < ActiveRecord::Base
	belongs_to :user
	has_and_belongs_to_many :users
  attr_accessible :address, :city, :country, :description, :latitude, :longitude, :name, :user_id, :state
end
