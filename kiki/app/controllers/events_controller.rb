class EventsController < ApplicationController

  def index
  	@now = Time.now
	#@current_weekday = @current_datetime.wday
  	@week_events = Event.getNextEvents(@now, 7)

	respond_to do |format|
        format.html { render :layout => !request.xhr? }
    end

  end

  def show
  	event_id = params[:id]
  	@event = Event.find(event_id)
  	@participants = Attendance.getEventParticipants(event_id)
  	@comments = Comment.getEventComments(event_id)
  	@attending = Attendance.attending?(1, event_id)

	respond_to do |format|
        format.html { render :layout => !request.xhr? }
    end
  end

  def attend_event

  	Attendance.setResponse(params[:user_id], params[:event_id], params[:rsvp])

#   user_id = params[:user_id]
#    event_id = params[:event_id]
#    Attendance.switchResponse(user_id, event_id)
  
#    @user_id = user_id
#    @event_id = event_id
#    @response = Attendance.where(user_id: user_id, event_id: event_id).first.response

    #redirect_to event_path(event_id) 
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
