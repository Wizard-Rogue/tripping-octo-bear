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

	belongs_to :organization
	has_many :participants
	has_many :users, :through => :participants


  attr_accessible :address, :city, :country, :description, :latitude, 
             :longitude, :name, :organization_id, :state, :start, :end, :photo

	has_attached_file :photo, :styles => {:small => "150x150!", :medium => "250x250!", :large => "300x300", :thumbnail => "100x100"}

end
