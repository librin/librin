class Tag < ActiveRecord::Base
	has_and_belong_to_many :resources
end
