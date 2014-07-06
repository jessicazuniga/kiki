class RelatedEvents < ActiveRecord::Base
  belongs_to :comment
  belongs_to :event
end
