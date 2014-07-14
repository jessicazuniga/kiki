class Event < ActiveRecord::Base
	has_many :attendances
	has_many :comments
	has_many :related_events

def self.getNextEvents(time, num_days)
	start_time = time.beginning_of_day
	end_time = (time + num_days.days).end_of_day

	start_time_string = start_time.to_s(:db)
	end_time_string = end_time.to_s(:db)

	Event.where("time >= '#{start_time_string}' and time <= '#{end_time_string}'").order(:time)
end

end

