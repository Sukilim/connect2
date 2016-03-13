class LocationsController < ApplicationController

 def new
 	@location = Location.new
 end 

 def create
 	@location = Location.create(location_params)
 end

 def edit
 end

 def update
 end

 def destroy
 end

 private

 def location_params
 	params.require(:location).permit(:location)
 end
end
