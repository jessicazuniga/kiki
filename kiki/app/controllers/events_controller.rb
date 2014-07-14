class EventsController < ApplicationController

  def index
  	@current_datetime = Time.new
	@current_weekday = @current_datetime.wday
  	@week_events = Event.getNextEvents(@current_datetime, 70)
  end

  def show
  	event_id = params[:id]
  	@event = Event.find(event_id)
  	@participants = Attendance.getEventParticipants(event_id)
  	@comments = Comment.getEventComments(event_id)
  end

end
