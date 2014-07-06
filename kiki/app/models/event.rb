class Event < ActiveRecord::Base
	has_many :attendances
	has_many :comments
	has_many :related_events
end
