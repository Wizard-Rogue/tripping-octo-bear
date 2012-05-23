class OrganizationsController < ApplicationController
  def show
    @user = User.find(params[:id])
    respond_to do | f |
      f.html
      f.json { render :json => @user }
    end
  end

  def index
  	@users = User.all
  end
end
