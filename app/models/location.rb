class Location < ActiveRecord::Base
	belongs_to :area
	#has_many :requests
	#has_many :listings

	#rails_admin do
	 # object_label_method :area_name
	#end


	#def area_name
	 # a = Area.find(self.area_id)
	 # return a.area
	#end
end
