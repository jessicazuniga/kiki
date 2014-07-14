class Attendance < ActiveRecord::Base
  belongs_to :user
  belongs_to :event


def self.getEventParticipants(event_id)
	Attendance.where("event_id = '#{event_id}' and response = TRUE")
end


end
