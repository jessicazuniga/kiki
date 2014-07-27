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
  
    @user_id = user_id
    @event_id = event_id
    @response = Attendance.where(user_id: user_id, event_id: event_id).first.response

    redirect_to event_path(event_id) 
  end

  def new

    @event = Event.new

	  respond_to do |format|
        format.html { render :layout => !request.xhr? }
    end

  end
   
  def create

    @event = Event.new(event_params)
   
    if @event.save
      redirect_to @event
    else
      render 'new', :layout => !request.xhr?
    end

  end
   
  private
    def event_params
      params.require(:event).permit(:name, :time_only, :date_only, :place)
    end

end
