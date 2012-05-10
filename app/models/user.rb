class User < ActiveRecord::Base
	has_many :participants
	has_many :events, :through => :participants
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
  :address, :city, :state, :country, :image, :phone, :website1, :website2, :contact_number
  # attr_accessible :title, :body
end
