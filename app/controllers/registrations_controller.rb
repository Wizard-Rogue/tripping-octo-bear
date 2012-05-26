class RegistrationsController < Devise::RegistrationsController
  
	def new
		super
	end
	
	def create
		@user = User.new(params[:user])
		if session["devise.twitter_data"]
			session["devise.twitter_data"].email = @user.email
			if @user = User.where(:email => session["devise.twitter_data"].email).first
				@user.update_attributes( :image => session["devise.twitter_data"].profile_image_url, :screen_name => session["devise.twitter_data"].screen_name)
		    @user.update_attributes( :website2 => session["devise.twitter_data"].website ) unless @user.website1 == session["devise.twitter_data"].website
			else
				@user = User.create_with_twitter(session["devise.twitter_data"], current_user)
			end
			flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "twitter"
			sign_in_and_redirect @user, :event => :authentication
		else
			@s = @user.is_organization
			super
		end
	end

end