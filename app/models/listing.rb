class Listing < ActiveRecord::Base
	belongs_to :user
	belongs_to :area
	belongs_to :location

	enum status: [:active, :publish]
	enum rent_sale: [:rent, :sale]
	enum house_condo: [:house, :condo]
	enum pet_friendly: [:yes, :no]

	#rails_admin do
	#  object_label_method :area_name
	#  object_label_method :location_name
	#end


	#def area_name
	#  a = Area.find(self.area_id)
	#  return a.area
	#end

	#def location_name
	#  l = Location.find(self.location_id)
	#  return l.location
	#end
end