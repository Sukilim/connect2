class Area < ActiveRecord::Base
	has_many :locations
	has_many :requests
	has_many :listings
end
