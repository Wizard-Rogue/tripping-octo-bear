class Participants < ActiveRecord::Base
	belongs_to :event
	has_many :users
  # attr_accessible :title, :body
end
