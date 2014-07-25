class Attendance < ActiveRecord::Base
  belongs_to :user
  belongs_to :event


def self.getEventParticipants(event_id)
	Attendance.where(event_id: event_id, response: TRUE)
end

def self.switchResponse(user_id, event_id)
	current_response = Attendance.where(user_id: user_id, event_id: event_id).first_or_create
	if current_response.response.nil? || current_response.response == FALSE
		current_response.response = TRUE
	elsif current_response.response == TRUE
		current_response.response = FALSE
	end
	current_response.save
end

end
