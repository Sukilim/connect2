class ListingsController < ApplicationController
  
  def new
  	@listing = Listing.new
  end

  def create
  	@listing = Listing.new(listing_params.merge(user_id: current_user.id, status: "active"))

  	if @listing.save
      respond_to do |format|
       format.html { redirect_to user_path(current_user.id), notice: 'Listing was successfully created.' }
      end
    else
      flash[:notice] = "Please let us know more details"
      redirect_to root_path
    end
  end

  def edit
  end

  def update
  	 if @listing.update(listing_params)
      redirect_to user_path(current_user.id)
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def listing_params
  	params.require(:listing).permit(:user_id, :area_id, :location_id, :rent_sale, :house_condo, :date_available, :unit_no, :price, :sq_ft, :no_of_rooms, :no_of_baths, :no_of_carpark, :pet_friendly, :additonal_info, :status)
  end 
end
