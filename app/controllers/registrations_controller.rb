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

	def edit
      @user = current_user
    end

    def update
      @user = User.find(current_user.id)
      unless @user.provider
      	super
      else
	    if @user.update_without_password(params[:user])
	      # Sign in the user bypassing validation in case his password changed
	      redirect_to root_path
	    else
	      render "edit"
	    end
	  end
    end
end