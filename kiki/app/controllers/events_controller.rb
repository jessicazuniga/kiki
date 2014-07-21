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
