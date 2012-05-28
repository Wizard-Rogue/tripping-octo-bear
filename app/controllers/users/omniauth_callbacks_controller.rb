class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def twitter
    @user = User.new
    access_token = request.env["omniauth.auth"]
    data = access_token.extra.raw_info
    if @user = User.where(:name => data.name).first
      @user.update_attributes( :image => data.profile_image_url, :screen_name => data.screen_name)
      @user.update_attributes( :website2 => access_token["info"]["urls"]["Twitter"] ) unless @user.website1 == access_token["info"]["urls"]["Twitter"]
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "twitter"
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.twitter_data"] = request.env["omniauth.auth"]["extra"]["raw_info"]
      session["devise.twitter_data"].website = request.env["omniauth.auth"]["info"]["urls"]["Twitter"]
      flash[:notice] = "Please provide your twitter's email address to finish registration."
      redirect_to new_user_registration_url
    end
  end
  
  def facebook
    @user = User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user)

    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "facebook"
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
  
  def passthru
  render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
	end
end
