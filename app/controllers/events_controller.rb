class EventsController < ApplicationController
  # GET /events
  # GET /events.json
  load_and_authorize_resource
  def index
    @events = Event.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end
  
  def join
  	if user_signed_in?
  		if @event.users.where(:id => current_user.id).first.nil?
				@event.users << current_user
				@event.save
				redirect_to event_url
			else
				redirect_to event_url, notice: 'Already joined this event'
			end
  	else
  		redirect_to new_user_session_url
  	end
  end

  # GET /events/1
  # GET /events/1.json
  def show

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
		@event = 	Event.new(params[:event])
		@event.user = current_user
    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
  	@event.users.clear
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end
  
  def remove
		if user_signed_in?
  		if @event.users.exists?(current_user)
  			@event.users.delete(current_user)
				redirect_to event_url, notice: 'Removed event'
			else
				redirect_to event_url, notice: 'You have not volunteered for this event'
			end
  	else
  		redirect_to new_user_session_url
  	end
  end
end
