class Organization < User

  has_many :events
  attr_accessible :latitude, :longitude, :description
end
