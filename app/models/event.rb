class Event < ActiveRecord::Base
  belongs_to :organization

  attr_accessible :address, :city, :country, :description, :latitude, 
             :longitude, :name, :organization_id, :state, :start, :end, :photo

  has_attached_file :photo

end
