class HomeController < ApplicationController
  def index
  	@current_datetime = Time.new
	@current_weekday = @current_datetime.wday
  	@week_events = Event.getNextEvents(@current_datetime, 70)
  end
end