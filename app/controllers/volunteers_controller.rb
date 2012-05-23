class VolunteersController < ApplicationController
  def show
  	@user = current_user
  	respond_to do | f |
      f.html
      f.json { render :json => @user }
    end
  end
end
