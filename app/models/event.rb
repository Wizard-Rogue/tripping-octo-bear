class Event < ActiveRecord::Base
	belongs_to :user
	has_and_belongs_to_many :users
  
  geocoded_by :address
  after_validation :geocode
  validates :street, :city, :state, :description, :name, presence: true


  def joined?(user)
  	users.exists? user
  end
  
  def organization
  	user = User.where(:id => self.user_id).first
  end

  def address
  	[street, city, state, country].compact.join(', ')
  end

 attr_accessible :address, :city, :country, :description, :latitude, 
             :longitude, :name, :state, :start, :end, :photo, :user_id, :street

	has_attached_file :photo, :styles => {:small => "150x150!", :medium => "250x250!", :large => "300x300", :thumbnail => "100x100"}

end
