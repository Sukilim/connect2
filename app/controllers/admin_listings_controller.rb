class AdminListingsController < ApplicationController

  def new
  	@admin_listing = AdminListing.new
  end

  def create
  	@admin_listing = AdminListing.new(admin_listing_params)

  	if @admin_listing.save
      respond_to do |format|
       format.html { redirect_to user_path(current_user.id), notice: 'Admin Listing was successfully created.' }
      end
    else
      flash[:notice] = "Please let us know more details"
      redirect_to root_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def admin_listing_params
  	params.require(:admin_listing).permit(:area, :location, :sq_ft, :avatar)
  end
end
