class Request < ActiveRecord::Base
	belongs_to :user
	belongs_to :area
	belongs_to :location

	validates :area_id, presence: true
	validates :no_of_rooms, presence: true
	validates :budget_min, presence: true
	validates :budget_max, presence: true

	rails_admin do
	  object_label_method :area_name
	  object_label_method :location_name
	end


	def area_name
	  a = Area.find(self.area_id)
	  return a.area
	end

	def location_name
	  l = Location.find(self.location_id)
	  return l.location
	end
end
