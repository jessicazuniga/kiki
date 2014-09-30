class CurrentGroup < ActiveRecord::Base
	belongs_to :user
  	belongs_to :group

	def self.setCurrentGroup(user_id, group_id)
		CurrentGroup.first_or_create_by(user_id: user_id).group_id
	end
  	
end
