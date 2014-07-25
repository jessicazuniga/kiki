class EventsController < ApplicationController

  def index
  	@current_datetime = Time.new
	  @current_weekday = @current_datetime.wday
  	@week_events = Event.getNextEvents(@current_datetime, 70)

	respond_to do |format|
        format.html { render :layout => !request.xhr? }
    end

  end

  def show
  	event_id = params[:id]
  	@event = Event.find(event_id)
  	@participants = Attendance.getEventParticipants(event_id)
  	@comments = Comment.getEventComments(event_id)

	respond_to do |format|
        format.html { render :layout => !request.xhr? }
    end
  end

  def attend_event
    user_id = params[:user_id]
    event_id = params[:event_id]
    Attendance.switchResponse(user_id, event_id)
    @participants = Attendance.getEventParticipants(event_id)

    @user_id = user_id
    @event_id = event_id
    @response = Attendance.where(user_id: user_id, event_id: event_id).first.response

    respond_to do |format|
      format.html { redirect_to events_path }
      format.json { head :no_content }
      format.js { render :layout => false }
    end
  end


end
