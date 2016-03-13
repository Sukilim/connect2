class PagesController < ApplicationController

	def index
		@admin_listing = AdminListing.all
		@media = MediaCoverage.all
		@instruction = Instruction.all
		@area = Area.all
    @user = User.new
    @user.build_user_profile
	end

	def new
    @request = Request.new
	end

end
