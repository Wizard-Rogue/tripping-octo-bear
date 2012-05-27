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

	has_attached_file :photo, :storage => :s3,
    :bucket => ENV['S3_BUCKET_NAME'],
    :s3_credentials => {
      :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
      :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
    }, :styles => {:small => "150x150!", :medium => "250x250!", :large => "300x300", :thumbnail => "100x100"}

end
