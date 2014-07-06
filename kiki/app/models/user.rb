class User < ActiveRecord::Base
	has_many :attendances
	has_many :comments
end
