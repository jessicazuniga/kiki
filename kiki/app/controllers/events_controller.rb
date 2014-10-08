
class EventsController < ApplicationController

  #before_action :authenticate_user!, :except => [:index, :show]

  def index

    if params.has_key?(:group_id)
      session[:current_group_id] = params[:group_id]
    end

    @now = Time.now
    if session.has_key?(:current_group_id)
      @selected_group = Group.where(id: session[:current_group_id]).first()
    	@week_events = Event.getNextEventsAndAttendence(@now, 14, current_user, session[:current_group_id])
    end

	  respond_to do |format|
      format.html { render :layout => !request.xhr? }
    end

  end

  def show
  	event_id = params[:id]
  	@event = Event.find(event_id)
  	@participants = Attendance.getEventParticipants(event_id)
    @comments = Comment.getEventComments(event_id)
    @attending = user_signed_in? ? Attendance.attending?(current_user.id, event_id) : nil

    @comment = Comment.new
    @comment.event_id = event_id
    @comment.user_id = 1

    @select_comments = params.has_key?(:comments)

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


  def add_comment

    @comment = Comment.new(comment_params)

    if @comment.save
      #@event = Event.find(params[:comment][:event_id])
      redirect_to :action => 'show', :id => params[:comment][:event_id], :comments => true
    else
      render 'new', :layout => !request.xhr?
    end

  end


  def new
    if user_signed_in?
      @event = Event.new
      respond_to do |format|
        format.html { render :layout => !request.xhr? }
      end
    else
      redirect_to new_user_session_path
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

  def change_group
    
    session[:current_group_id] = nil
    redirect_to :controller => 'groups', :action => 'index'

  end
   
  private
    def event_params
      params.require(:event).permit(:name, :time_only, :date_only, :place, :description, :group_id)
    end

  private
    def comment_params
      params.require(:comment).permit(:text, :user_id, :event_id)
    end

end
