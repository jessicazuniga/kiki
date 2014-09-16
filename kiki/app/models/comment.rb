class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
	has_many :related_events

def self.getEventComments(event_id)
	Comment.where("event_id = #{event_id}").order(created_at: :desc)
end

end
