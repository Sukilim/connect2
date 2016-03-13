class AreasController < ApplicationController

 def new
 	@area = Area.new
 end 

 def create
 	@area = Area.create(area_params)
 end

 def edit
 end

 def update
 end

 def destroy
 end

 private

 def area_params
 	params.require(:area).permit(:area)
 end

end
