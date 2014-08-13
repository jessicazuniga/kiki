class Event < ActiveRecord::Base
	has_many :attendances
	has_many :comments
	has_many :related_events
	validates :name, presence: true, length: { minimum: 3 }
	validates :place, presence: true, length: { minimum: 3 }
	validates :time, presence: true

	before_validation :store_datetime

	def date_only
	  time.strftime("%d/%m/%Y") if time.present?
	end 
	
	def time_only
	  time.strftime("%I:%M%p") if time.present?
	end
	
	def date_only=(dd)
	  # Change back to datetime friendly format
	  @date_only = Date.parse(dd).strftime("%Y-%m-%d") if dd.present?
	end
	
	def time_only=(tt)
	  # Change back to datetime friendly format
	  @time_only = Time.parse(tt).strftime("%H:%M:%S") if tt.present?
	end
	
	def store_datetime
	  self.time = DateTime.parse("#{@date_only} #{@time_only}") if @date_only.present? and @time_only.present? 
	end


	def self.getNextEvents(time, num_days)
		start_time = time.beginning_of_day
		end_time = (time + num_days.days).end_of_day
	
		Event.where("time >= '#{start_time.to_s(:db)}' and time <= '#{end_time.to_s(:db)}'").order(:time)
	end

end

